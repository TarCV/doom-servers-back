package com.github.tarcv.doom_servers

import org.springframework.data.jpa.repository.JpaRepository
import com.github.tarcv.doom_servers.entites.UserEntity

interface UsersRepository : JpaRepository<UserEntity, Long> {
	fun findByLogin(login: String?): UserEntity?
	fun existsByLogin(login: String): Boolean
}