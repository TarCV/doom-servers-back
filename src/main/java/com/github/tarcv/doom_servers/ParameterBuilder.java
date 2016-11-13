package com.github.tarcv.doom_servers;

interface ParameterBuilder<T> {
	void addKeyValue(String key, String value);
	void addCommand(String command, String... arguments);
	T build();
}