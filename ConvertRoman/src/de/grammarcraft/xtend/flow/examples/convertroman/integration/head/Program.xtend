package de.grammarcraft.xtend.flow.examples.convertroman.integration.head

import de.grammarcraft.xtend.flow.examples.convertroman.operations.DisplayError
import de.grammarcraft.xtend.flow.examples.convertroman.operations.DisplayResult
import de.grammarcraft.xtend.flow.examples.convertroman.operations.ReadNumberToConvert
import de.grammarcraft.xtend.flow.examples.convertroman.integration.body.Convert
import static de.grammarcraft.xtend.flow.data.None.None

class Program 
{
    def static void main(String[] args) 
    {
        val read_number_to_convert = new ReadNumberToConvert
        val display_result = new DisplayResult
	    val display_error = new DisplayError
	    val convert = new Convert
	    
	    // setup flow
	    read_number_to_convert -> convert
		convert.result -> display_result
		convert.error -> display_error
		
		// start flow
		read_number_to_convert <= None
    } 
}