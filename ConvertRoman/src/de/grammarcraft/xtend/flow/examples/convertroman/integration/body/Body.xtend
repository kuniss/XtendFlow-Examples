package de.grammarcraft.xtend.flow.examples.convertroman.integration.body

import de.grammarcraft.xtend.flow.annotations.Integration
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions.ConvertFromRoman
import de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions.ConvertToRoman
import de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions.DetermineNumberType
import de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions.ValidateArabicNumber
import de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions.ValidateRomanNumber

@Integration @Unit(
    inputPorts = #[
        @Port(name="number", type=String)
    ],
    outputPorts = #[
        @Port(name="result", type=String),
        @Port(name="error", type=String)
    ]
)
class Body {
	val determine_number_type = new DetermineNumberType
	val validate_roman_number = new ValidateRomanNumber
	val validate_arabic_number = new ValidateArabicNumber
	val convert_from_roman = new ConvertFromRoman
	val convert_to_roman = new ConvertToRoman
	
	new() {
	    number -> determine_number_type
		determine_number_type.romanNumber -> validate_roman_number
		determine_number_type.arabicNumber -> validate_arabic_number
		validate_arabic_number.output -> convert_to_roman
		validate_roman_number.output -> convert_from_roman
		convert_to_roman -> result
		convert_from_roman -> result
		
		validate_arabic_number.error -> error
		validate_roman_number.error -> error
	}
}