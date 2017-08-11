package com.github.tarcv.doom_servers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.tarcv.doom_servers.entities.SettingSectionsEntity;
import com.github.tarcv.doom_servers.entities.SettingsEntity;

@Controller
@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class SettingController {
	@Autowired
	SettingsRepository settingsRepository;
	
	@GetMapping("settings/byEngine")
	public Map<SettingSectionsEntity, List<SettingsEntity>> settingsForEngine(String engine) {
		List<SettingsEntity> settings = settingsRepository.findByEngineName(engine);
		return groupBySections( settings );
	}

	private static Map<SettingSectionsEntity, List<SettingsEntity>> groupBySections(List<SettingsEntity> settings) {
		Map<SettingSectionsEntity, List<SettingsEntity>> result = new HashMap<>();
		/*for (SettingsEntity setting : settings) {
			SettingSectionsEntity section = setting.getSection();
			result
				.computeIfAbsent(section, k -> new ArrayList<>())
				.add(setting);
		}*/
		return result;
	}
}
