package com.github.tarcv.doom_servers.entities;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "cvars", schema = "public", catalog = "servers")
@JsonAutoDetect
@Data
public class SettingsEntity {
    @Id
    @Column(name = "id", nullable = false)
    @JsonIgnore
    private long id;

    @Basic
    @JoinColumn(name = "section", referencedColumnName = "id", nullable = false)
    @ManyToOne
    @JsonIgnore
    private SettingSectionsEntity section;
    
    @Basic
    @Column(name = "name", nullable = false, length = 80)
    String name;

    @Basic
    @Column(name = "description", nullable = false, length = 200)
    private String description;

    @Basic
    @Column(name = "type", nullable = false, length = 20)
    private String type;

    @Basic
    @Column(name = "default_value", nullable = true, length = 20)
    private String defaultValue;

    @Basic
    @Column(name = "options", nullable = true, length = 800)
    private String options;

    @ManyToOne
    @JoinColumn(name = "engine", referencedColumnName = "id", nullable = false)
    @JsonIgnore
    private EnginesEntity engine;
}
