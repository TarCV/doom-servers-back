package com.github.tarcv.doom_servers;

import org.springframework.stereotype.Component;

/**
 * Created by TarCV on 05.11.2016.
 */

@Component
public class EngineFactory {
    public Engine create(String engine) {
        switch (engine.toLowerCase()) {
            case "zandronum":
                return new ZandornumConfigurationFactory();
            default:
                throw new IllegalArgumentException("Unknown engine");
        }
    }
}
