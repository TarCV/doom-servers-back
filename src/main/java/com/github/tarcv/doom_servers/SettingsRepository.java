package com.github.tarcv.doom_servers;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.github.tarcv.doom_servers.entities.EnginesEntity;
import com.github.tarcv.doom_servers.entities.SettingsEntity;

public interface SettingsRepository extends JpaRepository<SettingsEntity, Long> {
	List<SettingsEntity> findByEngineName(String name);
}
