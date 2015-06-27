package de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions

import de.grammarcraft.xtend.flow.annotations.Integration
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.unitlib.MapIt
import java.util.ArrayList
import java.util.List

@Integration @Unit(
    inputPorts = #[
        @Port(name="input", type=Integer)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ConvertToRoman {
    val factorize = new MapIt<Integer, List<Integer>>("factorize", [factorizeArabicNumber])
    val map_factors_to_digits = new MapIt<List<Integer>, List<String>>("map_factors_to_digits", [mapFactorsToDigits])
    val build_from_digits = new MapIt<List<String>, String>("Build_from_digits", [join])
    
    new() {
        input -> factorize
        factorize -> map_factors_to_digits
        map_factors_to_digits -> build_from_digits
        build_from_digits -> output
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