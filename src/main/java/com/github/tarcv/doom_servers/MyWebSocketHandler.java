package com.github.tarcv.doom_servers;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.tarcv.doom_servers.messages.Authenticated;
import com.github.tarcv.doom_servers.messages.ConsoleBuffer;
import com.github.tarcv.doom_servers.messages.ConsoleCommand;
import com.github.tarcv.doom_servers.messages.ConsoleResult;
import com.github.tarcv.doom_servers.messages.Hello;
import com.github.tarcv.doom_servers.messages.Mapper;
import com.github.tarcv.doom_servers.messages.Message;
import com.github.tarcv.doom_servers.messages.ServerStarted;

@Component
public class MyWebSocketHandler extends BinaryWebSocketHandler {
	private static final Logger LOG = LoggerFactory.getLogger(MyWebSocketHandler.class);
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<>());

	private final SimpMessagingTemplate frontWebsocket;

	@Autowired
	public MyWebSocketHandler(SimpMessagingTemplate frontWebsocket) {
		super();
		this.frontWebsocket = frontWebsocket;
	}

	public void sendToAll(Message object) throws JsonProcessingException {
		WebSocketMessage<?> message = serializeMessage(object);
		synchronized(sessions) {
			sessions.forEach(session -> {
				try {
					session.sendMessage(message);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			});
		}
	}

	private static WebSocketMessage<?> serializeMessage(Message object) throws JsonProcessingException {
		String serverAsJson = Mapper.writeValueAsString(object);
		WebSocketMessage<?> message = new TextMessage(serverAsJson);
		return message;
	}

	@Override
    public void handleTransportError(WebSocketSession session, Throwable throwable) throws Exception {
        LOG.error("error occured at sender " + session, throwable);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	sessions.remove(session);
        LOG.info(String.format("Session %s closed because of %s", session.getId(), status.getReason()));
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        LOG.info("Connected ... " + session.getId());
    	sessions.add(session);
    }

    @Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) throws Exception {
        assert message.isLast();
        ByteBuffer payload = message.getPayload();
        Message agentMessage = Mapper.readValue(payload.array(), payload.position(), payload.remaining(), Message.class);
        LOG.debug("message received: " + agentMessage.getClass().getSimpleName());
        if (agentMessage instanceof Hello) {
        	WebSocketMessage<?> response = serializeMessage(new Authenticated(true));
        	session.sendMessage(response);
        } else if (agentMessage instanceof ServerStarted) {
        	ServerStarted startedMessage = (ServerStarted)agentMessage;
        	if (startedMessage.isSuccessful()) {
        		List<String> commands = Collections.singletonList("cvarlist;echo DoomConsoleResultEnd");
        		WebSocketMessage<?> cvarlistCommand = serializeMessage(new ConsoleCommand(commands));
				session.sendMessage(cvarlistCommand );
        	}
        } else if (agentMessage instanceof ConsoleResult) {
        	LOG.debug(String.join(";", ((ConsoleResult)agentMessage).getLines()));
        } else if (agentMessage instanceof ConsoleBuffer) {
        	List<String> consoleLines = ((ConsoleBuffer)agentMessage).getLines();
			LOG.debug(String.join(";", consoleLines));
        	frontWebsocket.convertAndSend(FrontWebSocketConfig.FRONT_PREFIX + "/server/1/console", consoleLines);
        }

    }
}
