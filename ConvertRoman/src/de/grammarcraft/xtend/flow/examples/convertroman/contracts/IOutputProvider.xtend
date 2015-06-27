package de.grammarcraft.xtend.flow.examples.convertroman.contracts

interface IOutputProvider {
    def void display_result (String result);
    def void display_error (String errorMessage);   
}