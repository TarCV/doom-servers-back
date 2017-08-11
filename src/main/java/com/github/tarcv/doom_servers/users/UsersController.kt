package com.github.tarcv.doom_servers

import java.io.IOException
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import com.fasterxml.jackson.databind.ObjectMapper
import com.github.tarcv.doom_servers.entites.UserEntity
import org.springframework.web.bind.annotation.PathVariable
import com.github.tarcv.doom_servers.users.SignupValidator
//import org.springframework.security.crypto.password.PasswordEncoder
import com.github.tarcv.doom_servers.users.SignupUserData
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.http.converter.HttpMessageNotReadableException
import com.github.tarcv.doom_servers.users.SignupValidator2
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.InitBinder
import org.springframework.web.bind.WebDataBinder
import javax.validation.Valid

@RestController
@RequestMapping(path = arrayOf("/users"))
@CrossOrigin(origins = arrayOf("http://localhost:3000"))
class UsersController(
		val usersRepository: UsersRepository,
		var signupValidator: SignupValidator2/*,
		val userPasswordEncoder: PasswordEncoder*/) {
	@PostMapping
	@Throws(IOException::class)
	fun create(@Valid @RequestBody newUserData: SignupUserData/*, result: BindingResult*/): String {
		return "hello"
	}

	@GetMapping(path = arrayOf("/self"))
	fun profile(): Unit {
		throw UnsupportedOperationException();
	}
	
	@GetMapping(path = arrayOf("/{id}"))
	fun profile(@PathVariable id : Int?): Unit {
		throw UnsupportedOperationException();
	}

    @InitBinder
    fun initBinder(binder: WebDataBinder) {
        binder.addValidators(signupValidator);
    }
	
	companion object {
		private val LOG = LoggerFactory.getLogger(UsersController::class.java)
		private val jsonMapper = ObjectMapper()
	}
}