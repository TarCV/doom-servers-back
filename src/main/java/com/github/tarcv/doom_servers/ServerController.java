package com.github.tarcv.doom_servers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Spliterator;
import java.util.stream.Collector.Characteristics;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.tarcv.doom_servers.messages.RunServer;

@RestController
@RequestMapping(path = "/server")
@CrossOrigin(origins = "http://localhost:3000")
public class ServerController {
	private static final Logger LOG = LoggerFactory.getLogger(ServerController.class);
	private static final ObjectMapper jsonMapper = new ObjectMapper();
	
	@Autowired
	EngineFactory engineFactory;

    @Autowired
    protected MyWebSocketHandler webSocketHandler;
	
	@Autowired
	ServerProvider serverProvider;

	@PatchMapping(path = "/{id}/run")
	public String run(@PathVariable Long id, @RequestBody Map<String, Object> params) throws IOException {
		params.forEach((key, value) -> {
			String type = (value == null) ? "Object" : value.getClass().getSimpleName();
			LOG.debug("" + key + " = (" + type + ")" + value);
		});

		String engineName = "zandronum";
		Engine engine = engineFactory.create(engineName);
		Map<String, Object> updatedParams = addFixedParams(params);
		ServerConfiguration configuration = engine.prepareConfiguration(updatedParams);
		//Server server = serverProvider.getServer(configuration);

		//simpMessageTemplate.convertAndSend("", server);

		webSocketHandler.sendToAll(new RunServer(configuration));

		return "hello";
//		return server.toString();
	}

	private static Map<String, Object> addFixedParams(Map<String, Object> params) {
		Map<String, Object> output = new HashMap<>(params);
		return output;
	}
}
