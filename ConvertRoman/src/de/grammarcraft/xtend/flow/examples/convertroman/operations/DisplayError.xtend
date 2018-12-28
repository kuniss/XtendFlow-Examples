package de.grammarcraft.xtend.flow.examples.convertroman.operations

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit

@Operation @Unit(
    inputPorts = #[
        @Port(name="error", type=String)
    ]
)
class DisplayError {
    
    override process$error(String msg) {
        display_error(msg)
    }
    
    private def display_error(String errorMessage) {
        println('''Error: «errorMessage»''')
    }
    
    
}