package com.github.tarcv.doom_servers.entites

import javax.persistence.Id
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Table
import javax.persistence.GeneratedValue
import javax.validation.constraints.NotNull
import com.fasterxml.jackson.annotation.JsonIgnore

@Entity
@Table(name = "users", schema = "public", catalog = "servers")
class UserEntity (
    @Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	var id :Long = -1,

	val login :String,

	private val passwordHash :String,

	val email :String
)