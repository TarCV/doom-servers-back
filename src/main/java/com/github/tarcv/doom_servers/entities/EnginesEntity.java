package com.github.tarcv.doom_servers.entities;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Map;

import javax.persistence.*;

@Entity
@Table(name = "engines", schema = "public", catalog = "servers")
@Data
public class EnginesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private long id;

    @Basic
    @Column(name = "name", nullable = false, length = 20)
    private String name;
}
