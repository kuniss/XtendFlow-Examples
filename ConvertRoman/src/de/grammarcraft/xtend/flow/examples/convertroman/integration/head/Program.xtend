package de.grammarcraft.xtend.flow.examples.convertroman.integration.head

import de.grammarcraft.xtend.flow.examples.convertroman.operations.providers.Providers
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IInputProvider
import de.grammarcraft.xtend.flow.examples.convertroman.contracts.IOutputProvider
import de.grammarcraft.xtend.flow.examples.convertroman.integration.body.Body

class Program 
{
    def static void main(String[] args) 
    {
        val providers = new Providers
        val input = providers as IInputProvider
        val output = providers as IOutputProvider
        
        val body = new Body
        val head = new Head(input, body, output)
        
        head.run()
    } 
}