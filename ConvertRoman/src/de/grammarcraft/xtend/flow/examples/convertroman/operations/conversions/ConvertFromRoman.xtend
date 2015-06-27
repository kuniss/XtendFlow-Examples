package de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import java.util.ArrayList
import java.util.List

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ConvertFromRoman 
{
    override process$input(String romanNumber) {
        val values = mapRomanNumberToValues(romanNumber)
        val negatedValues = applySubstrationRule(values)
        output <= Integer.toString(negatedValues.reduce[i,j|i+j])
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
