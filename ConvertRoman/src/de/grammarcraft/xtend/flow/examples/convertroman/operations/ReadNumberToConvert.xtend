package de.grammarcraft.xtend.flow.examples.convertroman.operations

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IInputProvider
import de.grammarcraft.xtend.flow.data.None

@Operation @Unit(
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ReadNumberToConvert {
	
    IInputProvider inputProvider
    
    new(IInputProvider inputProvider) {
        this.inputProvider = inputProvider
    }
    
    override process$start(None msg) {
        output <= this.inputProvider.read_number_to_convert()
    }
	
}