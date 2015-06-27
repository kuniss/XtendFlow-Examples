package de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import java.util.ArrayList
import java.util.List

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=Integer)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ConvertToRoman 
{
    override process$input(Integer arabicNumber) {
        val factors = factorizeArabicNumber(arabicNumber)
        val digits = mapFactorsToDigits(factors)
        output <= digits.join
    }

    val MAP = #{
        1000 -> "M", 
        900 -> "CM", 
        500 -> "D", 
        400 -> "CD",
        100 -> "C", 
        90 -> "XC", 
        50 -> "L", 
        40 -> "XL",
        10 -> "X", 
        9 -> "IX", 
        5 -> "V", 
        4 -> "IV",
        1 -> "I"
    }
    private def List<Integer> factorizeArabicNumber(int arabicNumberIn) {
        val factors = new ArrayList
        var arabicNumber = arabicNumberIn
        val sortedKeys = MAP.keySet.sort.reverse
        while (arabicNumber > 0) {
            for(f : sortedKeys) {
                while (arabicNumber >= f) {
                    factors.add(f);
                    arabicNumber -= f;
                }
            }
        }
        return factors
    }
 
    private def List<String> mapFactorsToDigits(List<Integer> factors) {
        factors.map[f | MAP.get(f)]
    }
}