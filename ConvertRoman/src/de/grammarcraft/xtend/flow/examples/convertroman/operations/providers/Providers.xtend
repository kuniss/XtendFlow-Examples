package de.grammarcraft.xtend.flow.examples.convertroman.operations.providers

import java.util.Scanner
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IOutputProvider
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IInputProvider

class Providers implements IInputProvider, IOutputProvider {
    
    override read_number_to_convert() {
        val s = new Scanner(System.in);
        print('Enter roman or arabic number: ')
        return s.nextLine().trim()
    }
    
    override display_result(String result) {
        println(result)
    }
    
    override display_error(String errorMessage) {
        println('''Error: «errorMessage»''')
    }
    
}