package com.github.tarcv.doom_servers.users

import org.springframework.validation.Errors
import org.springframework.validation.Validator
import org.springframework.stereotype.Component
import org.springframework.validation.ValidationUtils

@Component
class SignupValidator2 : Validator {
	override fun validate(target: Any?, errors: Errors?) {
		System.out.println("checked2");
		//System.out.println(errors!!.getFieldValue("login"));
		ValidationUtils.rejectIfEmpty(errors, "login", "field.required")
	}
		

	override fun supports(clazz: Class<*>?)
			= SignupUserData::class.javaObjectType.isAssignableFrom(clazz)
}