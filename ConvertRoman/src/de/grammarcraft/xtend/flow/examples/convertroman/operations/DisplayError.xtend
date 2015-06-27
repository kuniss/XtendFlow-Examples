package de.grammarcraft.xtend.flow.examples.convertroman.operations

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Unit
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IOutputProvider

@Operation @Unit(
    inputPorts = #[
        @Port(name="error", type=String)
    ]
)
class DisplayError {
    
    IOutputProvider outputProvider
    
    new (IOutputProvider outputProvider) {
        this.outputProvider = outputProvider
    }
    
    override process$error(String msg) {
        this.outputProvider.display_error(msg)
    }
    
}