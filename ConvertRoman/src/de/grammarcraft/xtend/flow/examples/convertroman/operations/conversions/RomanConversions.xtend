package de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions

import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.annotations.Operation
import java.util.regex.Pattern

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="romanNumber", type=String),
        @Port(name="arabicNumber", type=Integer)
    ]
)
class DetermineNumberType {
    
    override process$input(String number) {
        try {
            arabicNumber <= Integer.parseInt(number);
        }
        catch (NumberFormatException e) {
            romanNumber <= number
        }
    }
}

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="valid", type=String),
        @Port(name="invalid", type=String)
    ]
)
class ValidateRomanNumber {
    
    override process$input(String romanNumber) {
        if (Pattern.matches("^[IVXLCDM]+$", romanNumber.toUpperCase))
            valid <= romanNumber
        else
            invalid <= '''Invalid roman digit found in "«romanNumber»"''';
    }
    
}

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=Integer)
    ],
    outputPorts = #[
        @Port(name="valid", type=Integer),
        @Port(name="invalid", type=String)
    ]
)
class ValidateArabicNumber {
    
    override process$input(Integer arabicNumber) {
        if (arabicNumber >= 0 && arabicNumber <= 3000)
            valid <= arabicNumber
        else
            invalid <= '''Invalid arabic number "«arabicNumber»"; must be in range 1..3000''';
    }
    
}
