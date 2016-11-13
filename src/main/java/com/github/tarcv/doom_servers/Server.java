package com.github.tarcv.doom_servers;

import java.io.Serializable;

/**
 * Created by TarCV on 05.11.2016.
 */
public class Server implements Serializable {
	private static final long serialVersionUID = 6929611599394688489L;

	private final ServerConfiguration configuration;

	public Server(ServerConfiguration configuration) {
		this.configuration = configuration;
	}

	public ServerConfiguration getConfiguration() {
		return configuration;
	}
}
