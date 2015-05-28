package de.grammarcraft.xtend.flow.examples.convertroman

import de.grammarcraft.xtend.flow.annotations.Integration
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.annotations.Operation

@Integration @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class Convert {
	val determine_number_type = new DetermineNumberType
	val validate_roman_number = new ValidateRomanNumber
	val validate_arabic_number = new ValidateArabicNumber
	val convert_from_roman = new ConvertFromRoman
	val convert_to_roman = new ConvertToRoman
	
	new() {
		determine_number_type.romanNumber -> validate_roman_number
		determine_number_type.arabicNumber -> validate_arabic_number
		validate_arabic_number -> convert_to_roman
		validate_roman_number -> convert_from_roman
	}
}


@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="romanNumber", type=String),
        @Port(name="arabicNumber", type=String)
    ]
)
class DetermineNumberType {
	
	override process$input(String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ValidateRomanNumber {
	
	override process$input(String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ValidateArabicNumber {
	
	override process$input(String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

@Integration @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ConvertToRoman {
}

@Integration @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ConvertFromRoman {
	val map_to_values = new MapToValues
	val apply_substraction_rule = new ApplySubstractionRule
	val sum = new Sum
}

