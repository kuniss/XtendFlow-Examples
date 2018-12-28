package de.grammarcraft.xtend.flow.examples.convertroman.operations

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.data.None
import java.util.Scanner

@Operation @Unit(
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ReadNumberToConvert {
	
    override process$start(None msg) {
        output <= [
            val s = new Scanner(System.in);
            print('Enter roman or arabic number: ')
            s.nextLine().trim()
        ]
    }
    
}