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
	private static final String INVERT_CVAR_PREFIX = RESERVED_PARAM_PREFIX + "invert_";

    @Override
    public Configuration prepareConfiguration(Map<String, String> params) {
        LOG.info(params.toString());
        String commandLineString = createCommandLine();
        Map<String, String> configs = createConfigs(params);
        Objects.requireNonNull(commandLineString);
        Objects.requireNonNull(configs);
        return new Configuration(commandLineString, configs);
    }

    private Map<String, String> createConfigs(Map<String, String> params) {
        ConfigBuilder configuration = new ConfigBuilder(" ", " ", "\n");
        params.entrySet().stream()
                .filter(stringStringEntry -> !stringStringEntry.getKey().isEmpty())
                .filter(stringStringEntry -> !stringStringEntry.getKey().startsWith(RESERVED_PARAM_PREFIX))
                // TODO whitelist filtering
                .forEach(stringStringEntry -> {
                    String value = stringStringEntry.getValue();
                    String fixedValue;
                    if ("false".equalsIgnoreCase(value)) {
                        fixedValue = "0";
                    } else if ("true".equalsIgnoreCase(value)) {
                        fixedValue = "1";
                    } else {
                        fixedValue = value;
                    }
                    configuration.addKeyValue(stringStringEntry.getKey(), fixedValue);
                });

        // Fixed parameters should be added after copying params to make sure they were't overridden by user
        addGameMode(configuration, params);
        return Collections.singletonMap(CONFIG_FILENAME, configuration.toString());
    }

    private void addGameMode(ConfigBuilder configs, Map<String, String> params) {
        String gameMode = params.get("__gameMode");
        if (gameMode == null) {
            throw new IllegalArgumentException("Gamemode was not defined");
        }
        configs.addKeyValue(gameMode, "1");
    }

    private String createCommandLine() {
        ConfigBuilder commandline = new ConfigBuilder("=", " ", " ");
        commandline.addCommand("-host");
        commandline.addCommand("+exec", CONFIG_FILENAME);
        return commandline.toString();
    }

    private class ConfigBuilder {
        private StringBuilder output = new StringBuilder();
        private final String keyValueDelimiter;
        private final String fragmentDelimiter;
        private final String argumentDelimiter;
        private final Set<String> definedKeys = new HashSet<>();

        private ConfigBuilder(String keyValueDelimiter, String argumentDelimiter, String fragmentDelimiter) {
            this.keyValueDelimiter = keyValueDelimiter;
            this.fragmentDelimiter = fragmentDelimiter;
            this.argumentDelimiter = argumentDelimiter;
        }

        public void addKeyValue(String key, String value) {
            addFragmentDelimiter();
            if (definedKeys.contains(key)) {
                throw new IllegalArgumentException("Keys with the same name cannot be defined two times - " + key);
            }
            output.append(key)
                    .append(keyValueDelimiter)
                    .append(value);
            definedKeys.add(key);
        }

        public void addCommand(String command, String... arguments) {
            addFragmentDelimiter();
            String[] combined = prepend(arguments, command);
            String fragment = String.join(argumentDelimiter, (CharSequence[]) combined);
            output.append(fragment);
        }

        private void addFragmentDelimiter() {
            if (output.length() > 0) {
                output.append(fragmentDelimiter);
            }
        }

        @Override
        public String toString() {
            return output.toString();
        }
    }

    private static String[] prepend(String[] array, String item) {
        String[] combined = new String[array.length+1];
        System.arraycopy(array, 0, combined, 1, array.length);
        combined[0] = item;
        return combined;
    }
}
