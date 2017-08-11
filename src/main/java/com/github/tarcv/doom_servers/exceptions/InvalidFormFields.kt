package com.github.tarcv.doom_servers.exceptions

import java.util.Collections

class InvalidFormFields(errors: Map<String, String>?) : Exception() {
	val fields: Map<String, String>

	init {
		fields = Collections.unmodifiableMap(errors)
	}

	constructor(errors: Collection<FormDataError>) : this(errors.associate { Pair(it.key, it.message) })
}

data class FormDataError(val key: String, val message: String)