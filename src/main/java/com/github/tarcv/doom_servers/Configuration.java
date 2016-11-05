package com.github.tarcv.doom_servers;

import java.util.Collections;
import java.util.Map;

/**
 * Created by TarCV on 05.11.2016.
 */
public class Configuration {
    private final String commandline;
    private final Map<String, String> configs;

    public Configuration(String commandline, Map<String, String> configs) {
        this.commandline = commandline;
        this.configs = configs;
    }

    public String getCommandline() {
        return commandline;
    }

    /**
     * Configuration files content in the following format:<br />
     * (filename => file content with unix-style line endings (\n))
     * @return Configuration files data
     */
    public Map<String, String> getConfigs() {
        return Collections.unmodifiableMap(configs);
    }
}
