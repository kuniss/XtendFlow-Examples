package de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions

import de.grammarcraft.xtend.flow.annotations.Integration
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.unitlib.MapIt
import java.util.ArrayList
import java.util.List

@Integration @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ConvertFromRoman {
    val map_to_values = new MapIt<String, List<Integer>>("map_to_values", [mapRomanNumberToValues])
    val apply_substraction_rule = new MapIt<List<Integer>, List<Integer>>("apply_substration_rule", [applySubstrationRule])
    val sum = new MapIt<List<Integer>, String>("sum", [Integer.toString(reduce[i,j|i+j])])
    
    new() {
        input -> map_to_values
        map_to_values -> apply_substraction_rule
        apply_substraction_rule -> sum
        sum -> output
    }
    
    static val mapR2I = #{
        'I' -> 1,
        'V' -> 5,
        'X' -> 10,
        'L' -> 50,
        'C' -> 100,
        'D' -> 500,
        'M' -> 1000
    }
    private static def List<Integer> mapRomanNumberToValues(String romanNumber) {
            val res = romanNumber.toUpperCase.toCharArray.map[d|mapR2I.get(d.toString)]
            return res
    }
    
    private static def List<Integer> applySubstrationRule(List<Integer> values) {
        val List<Integer> negatedValues = new ArrayList(values)

        for (var i = 0; i < negatedValues.size - 1; i++) { 
            if (negatedValues.get(i + 1) > negatedValues.get(i))
                negatedValues.set(i, negatedValues.get(i)*-1);
        }

        return negatedValues;
    }
    
}
