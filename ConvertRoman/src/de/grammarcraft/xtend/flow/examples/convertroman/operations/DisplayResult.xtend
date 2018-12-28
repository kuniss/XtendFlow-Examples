package de.grammarcraft.xtend.flow.examples.convertroman.operations

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit

@Operation @Unit(
    inputPorts = #[
        @Port(name="input", type=String)
    ]
)
class DisplayResult {
    
    override process$input(String msg) {
        println(msg)
    }
}