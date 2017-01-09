package com.github.tarcv.doom_servers;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by TarCV on 05.11.2016.
 */
public class ZandornumConfigurationFactory implements Engine {
	private static final Logger LOG = LoggerFactory.getLogger(ZandornumConfigurationFactory.class);
    private static final String CONFIG_FILENAME = "server.cfg";
    private static final String RESERVED_PARAM_PREFIX = "__";

    @Override
    public ServerConfiguration prepareConfiguration(Map<String, Object> params) {
        LOG.info(params.toString());
        List<String> commandLineString = createCommandLine();
        Map<String, List<String>> configs = createConfigs(params);
        Objects.requireNonNull(commandLineString);
        Objects.requireNonNull(configs);
        return new ServerConfiguration(commandLineString, configs);
    }

    private Map<String, List<String>> createConfigs(Map<String, Object> params) {
        ParameterBuilder<List<String>> configuration = new ConfigFileBuilder(" ");
        params.entrySet().stream()
                .filter(stringStringEntry -> !stringStringEntry.getKey().isEmpty())
                .filter(stringStringEntry -> !stringStringEntry.getKey().startsWith(RESERVED_PARAM_PREFIX))
                // TODO whitelist filtering
                .forEach(stringStringEntry -> {
                    String value = String.valueOf(stringStringEntry.getValue());
                    if ("false".equalsIgnoreCase(value)) {
                        value = "0";
                    } else if ("true".equalsIgnoreCase(value)) {
                        value = "1";
                    }
                    configuration.addKeyValue(stringStringEntry.getKey(), value);
                });

        // Fixed parameters should be added after copying params to make sure they were't overridden by user
        addGameMode(configuration, params);
        return Collections.singletonMap(CONFIG_FILENAME, configuration.build());
    }

    private void addGameMode(ParameterBuilder<?> configs, Map<String, Object> params) {
        String gameMode = String.valueOf(params.get("__gameMode"));
        if (gameMode == null) {
            throw new IllegalArgumentException("Gamemode was not defined");
        }
        configs.addKeyValue(gameMode, "1");
    }

    private List<String> createCommandLine() {
        ParameterBuilder<List<String>> commandline = new CommandLineBuilder(" ");
        commandline.addCommand("-host");
        commandline.addCommand("-private");
        commandline.addCommand("+exec", CONFIG_FILENAME);
        commandline.addCommand("+echo", "DoomServerReady");	//agent will wait for this line to appear in STDOUT/log
        return commandline.build();
    }

    static String[] prepend(String[] array, String item) {
        String[] combined = new String[array.length+1];
        System.arraycopy(array, 0, combined, 1, array.length);
        combined[0] = item;
        return combined;
    }
}
