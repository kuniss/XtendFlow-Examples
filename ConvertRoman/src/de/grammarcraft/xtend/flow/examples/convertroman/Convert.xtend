package de.grammarcraft.xtend.flow.examples.convertroman

import de.grammarcraft.xtend.flow.annotations.Integration
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.annotations.Operation
import java.util.List
import de.grammarcraft.xtend.flow.unitlib.MapIt

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
		validate_arabic_number.output -> convert_to_roman
		validate_roman_number.output -> convert_from_roman
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
        @Port(name="output", type=String),
        @Port(name="error", type=Exception)
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
        @Port(name="output", type=String),
        @Port(name="error", type=Exception)
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
        @Port(name="output", type=Integer)
    ]
)
class ConvertFromRoman {
	val map_to_values = new MapIt<String, List<Integer>>("map_to_values", [mapRomanNumberToValues])
	val apply_substraction_rule = new MapIt<List<Integer>, List<Integer>>("apply_substration_rule", [applySubstrationRule])
	val sum = new MapIt<List<Integer>, Integer>("sum", [reduce[i,j|i+j]])
	
	new() {
		input -> map_to_values
		map_to_values -> apply_substraction_rule
		apply_substraction_rule -> sum
		sum -> output
	}
	
	private static def List<Integer> mapRomanNumberToValues(String romanNumber) {
		// TODO implement mapRomanNumberToValues and move to operation
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	private static def List<Integer> applySubstrationRule(List<Integer> valueList) {
		// TODO implement applySubstrationRule and move to operation
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

