package com.github.tarcv.doom_servers.entities;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "sections", schema = "public", catalog = "servers")
@Data
public class SettingSectionsEntity {
    @Id
    @Column(name = "id", nullable = false)
    @JsonIgnore
    private long id;

    @Basic
    @Column(name = "name", nullable = false, length = 20)
    private String name;

    @Override
    public String toString() {
    	return name;
    }
}
