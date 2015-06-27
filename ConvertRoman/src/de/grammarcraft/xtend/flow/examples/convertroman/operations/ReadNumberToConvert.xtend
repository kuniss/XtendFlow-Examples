package de.grammarcraft.xtend.flow.examples.convertroman.operations

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IInputProvider

@Operation @Unit(
    inputPorts = #[
        @Port(name="start", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ReadNumberToConvert {
	
    IInputProvider inputProvider
    
    new(IInputProvider inputProvider) {
        this.inputProvider = inputProvider
    }
    
    override process$start(String msg) {
		output <= this.inputProvider.read_number_to_convert()
	}
	
}