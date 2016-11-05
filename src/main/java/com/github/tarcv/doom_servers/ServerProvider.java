package com.github.tarcv.doom_servers;

import org.springframework.stereotype.Component;

/**
 * Created by TarCV on 05.11.2016.
 */
@Component
public class ServerProvider {
    public Server getServer(Configuration configuration) {
        return new Server();
    }
}
