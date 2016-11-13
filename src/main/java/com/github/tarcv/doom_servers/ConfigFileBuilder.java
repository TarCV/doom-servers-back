package com.github.tarcv.doom_servers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;

import org.apache.commons.lang3.StringEscapeUtils;

class ConfigFileBuilder implements ParameterBuilder<List<String>> {
    private final String argumentDelimiter;
    private final Set<String> definedKeys = new HashSet<>();
    private final List<String> output = new ArrayList<>();

    ConfigFileBuilder(String argumentDelimiter) {
        this.argumentDelimiter = argumentDelimiter;
    }

    /* (non-Javadoc)
	 * @see com.github.tarcv.doom_servers.ParameterBuilder#addKeyValue(java.lang.String, java.lang.String)
	 */
    @Override
	public void addKeyValue(String key, String value) {
        if (definedKeys.contains(key)) {
            throw new IllegalArgumentException("Keys with the same name cannot be defined two times - " + key);
        }
        String fixedValue = value;
        if (fixedValue.contains(" ")) {
        	// TODO: find better escape method
        	fixedValue = "\"" + StringEscapeUtils.escapeJava(fixedValue) + "\"";
        }
        String line = String.format("%s %s", key, fixedValue);
        output.add(line);
        definedKeys.add(key);
    }

    /* (non-Javadoc)
	 * @see com.github.tarcv.doom_servers.ParameterBuilder#addCommand(java.lang.String, java.lang.String)
	 */
    @Override
	public void addCommand(String command, String... arguments) {
        String[] combined = ZandornumConfigurationFactory.prepend(arguments, command);
        String fragment = String.join(argumentDelimiter, (CharSequence[]) combined);
        output.add(fragment);
    }

    @Override
    public List<String> build() {
        return new ArrayList<String>(output);
    }
}