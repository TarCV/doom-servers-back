package com.github.tarcv.doom_servers;

import java.util.Map;

/**
 * Created by TarCV on 05.11.2016.
 */
interface Engine {
	ServerConfiguration prepareConfiguration(Map<String, String> params);
}
