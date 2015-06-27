package de.grammarcraft.xtend.flow.examples.convertroman.operations

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IOutputProvider

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ]
)
class DisplayResult {
    
    IOutputProvider outputProvider
    
    new (IOutputProvider outputProvider) {
        this.outputProvider = outputProvider
    }
	
	override process$input(String msg) {
		this.outputProvider.display_result(msg)
	}
	
}