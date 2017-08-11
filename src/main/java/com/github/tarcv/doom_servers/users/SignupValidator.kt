package com.github.tarcv.doom_servers.users

import com.github.tarcv.doom_servers.entites.UserEntity
import com.github.tarcv.doom_servers.exceptions.InvalidData
import kotlin.reflect.KProperty
import com.github.tarcv.doom_servers.exceptions.InvalidFormFields
import com.github.tarcv.doom_servers.exceptions.FormDataError
import com.github.tarcv.doom_servers.UsersRepository
import org.springframework.context.annotation.Bean

class SignupValidator(val usersRepository: UsersRepository) {
	@Throws(InvalidData::class)
	fun validate(userData: SignupUserData): SignupUserData {
		val v = ObjectValidator(userData)

		val login = v.validateProperty(SignupUserData::login)
			.required()
			.failIf("Login is already taken")
			{
			 usersRepository.existsByLogin(it!!)
			}
			.value()

		val password = v.validateProperty(SignupUserData::password)
			.required()
			.validate { null }	//TODO
			.value()

		val email = v.validateProperty(SignupUserData::email)
			.required()
			.validate { null }	//TODO
			.value()

		v.requireNotFieldsLeft()
		v.throwIfErrors()

		return SignupUserData(login!!, password!!, userData.confirmPassword, email!!)
	}

}

class ObjectValidator<T: Any>(val data:T) {
	val errorsOut: MutableList<FormDataError> = ArrayList<FormDataError>()
	val checkedProperties: MutableSet<String> = HashSet<String>()

	fun <PropT> validateProperty(property: KProperty<PropT>) : DataEntry<PropT> {
		checkedProperties.add(property.name)
		return DataEntry(property.name, ValueState.MISSING, errorsOut);
/*		val value = property.get(data)
		return if (value == null) {
			DataEntry(property.name, ValueState.MISSING, errorsOut)
		} else {
			DataEntry(property.name, value, errorsOut)
		}*/
	}

	fun requireNotFieldsLeft() {
		/*val properties: Collection<KProperty<Any>> = SignupUserData::class.memberProperties
		val uncheckedProperties = properties
			.map({ it.name })
			.subtract(checkedProperties)
		if (uncheckedProperties.isNotEmpty()) {
			throw InvalidData()
		}*/
	}
	
	fun throwIfErrors() {
		if (errorsOut.isNotEmpty()) {
			throw InvalidFormFields(errorsOut)
		}
	}
}

class DataEntry<T>
	private constructor(val key: String, val value: T?, val valueState: ValueState, val errorsOut: MutableList<FormDataError>) {

	init {
		if (valueState != ValueState.PRESENT && value != null) {
			throw IllegalArgumentException("Value cannot be passed when valueState is not PRESENT")
		}
		if (valueState == ValueState.PRESENT && value == null) {
			throw IllegalArgumentException("Value should be passed when valueState is PRESENT")
		}
	}

	constructor (key: String, valueState: ValueState, errorsOut: MutableList<FormDataError>) : this(key, null, valueState, errorsOut)
    constructor (key: String, value: T, errorsOut: MutableList<FormDataError>) : this(key, value, ValueState.PRESENT, errorsOut)

    fun required(): DataEntry<T> {
		if (valueState == ValueState.INVALID) {
			return this;
		}

		if (value == null) {
			assert(valueState == ValueState.MISSING)
			errorsOut.add(FormDataError(key, "The field is required"))
			return DataEntry<T>(key, ValueState.INVALID, errorsOut);
		}
		
		return this;	
	}
	
	fun failIf(message: String, predicate: (T) -> Boolean) = validate() {
		if (predicate(it)) {
			message
		} else {
			null
		}
	}
	
	fun validate(predicate: (T) -> String?): DataEntry<T> {
		if (valueState == ValueState.INVALID) {
			return this;
		}
		if (value == null) {
			assert(valueState == ValueState.MISSING)
			return this;
		}

		val error = predicate(value)
		if (error != null) {
			errorsOut.add(FormDataError(key, error))
			return DataEntry<T>(key, ValueState.INVALID, errorsOut);
		}

		return this;
	}

	fun value(): T? {
		if (valueState != ValueState.PRESENT) {
			return null
		}
		return value
	}
}

enum class ValueState {
	PRESENT,
	INVALID,
	MISSING
}
