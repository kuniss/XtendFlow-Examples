package de.grammarcraft.xtend.flow.examples.convertroman

import de.grammarcraft.xtend.flow.annotations.Operation
import de.grammarcraft.xtend.flow.annotations.Port
import de.grammarcraft.xtend.flow.annotations.Unit

@Operation @Unit(
    inputPorts = #[
        @Port(name="start", type=String)
    ],
    outputPorts = #[
        @Port(name="output", type=String)
    ]
)
class ReadNumberToConvert {
	
	override process$start(String msg) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}