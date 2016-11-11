package com.github.tarcv.doom_servers;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class MyWebSocketHandler extends BinaryWebSocketHandler {
	private static final Logger LOG = LoggerFactory.getLogger(MyWebSocketHandler.class);
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<>());

	public void sendToAll(Object object) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String serverAsJson = mapper.writeValueAsString(object);

		synchronized(sessions) {
			WebSocketMessage<?> message = new TextMessage(serverAsJson);
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
        Message agentMessage = new ObjectMapper().readValue(payload.array(), payload.position(), payload.remaining(), Message.class);
        LOG.debug("message received: " + agentMessage.getClass().getSimpleName());
	}
}
