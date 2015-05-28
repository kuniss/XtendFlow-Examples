package de.grammarcraft.xtend.flow.examples.convertroman


class ConvertRoman {
	
	val read_number_to_convert = new ReadNumberToConvert
	val convert = new Convert
	val display_result = new DisplayResult
	
	new() {
		read_number_to_convert.output -> convert
		convert -> display_result
	}
	
}