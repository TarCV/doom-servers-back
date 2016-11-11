package com.github.tarcv.doom_servers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping(path = "server")
public class ServerController {
	@Autowired
	EngineFactory engineFactory;

    @Autowired
    protected MyWebSocketHandler webSocketHandler;
	
	@Autowired
	ServerProvider serverProvider;

	@RequestMapping(path = "run", method = {RequestMethod.POST})
	public String run(@RequestParam Map<String,String> params) throws JsonProcessingException {
		String engineName = params.get("__engine");
		Engine engine = engineFactory.create(engineName);
		Map<String, String> updatedParams = addFixedParams(params);
		Configuration configuration = engine.prepareConfiguration(updatedParams);
		Server server = serverProvider.getServer(configuration);

		//simpMessageTemplate.convertAndSend("", server);
		webSocketHandler.sendToAll(server);

		return "hello";
//		return server.toString();
	}

	private Map<String, String> addFixedParams(Map<String, String> params) {
		Map<String, String> output = new HashMap<>(params);
		return output;
	}
}
