package com.github.tarcv.doom_servers;

import java.util.AbstractMap;
import java.util.Map;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class AgentController {
    @MessageMapping("/agent")
    @SendTo("/test")
    public Map.Entry<String, String> greeting() throws Exception {
        Thread.sleep(1000); // simulated delay
        return new AbstractMap.SimpleImmutableEntry<String, String>("hello", "agent");
    }
}
