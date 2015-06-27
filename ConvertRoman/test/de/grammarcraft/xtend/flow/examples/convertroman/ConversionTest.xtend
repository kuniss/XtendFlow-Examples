package de.grammarcraft.xtend.flow.examples.convertroman

import de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions.ConvertFromRoman
import de.grammarcraft.xtend.flow.examples.convertroman.operations.conversions.ConvertToRoman
import org.junit.Test

import static org.junit.Assert.*

class ConversionTest {
    
    private def test_from_roman(String romanNumber, int arabicNumber) {
        val c = new ConvertFromRoman
        c -> [assertEquals(Integer.toString(arabicNumber), it)]
        c <= romanNumber
    }

    @Test
    def test_from_roman() {
        test_from_roman('I', 1)
        test_from_roman("IV", 4)
        test_from_roman("MCMLXXXIV", 1984)
        test_from_roman("MMXV", 2015)
    }
    
    private def test_to_roman(int arabicNumber, String romanNumber) {
        val c = new ConvertToRoman
        c -> [assertEquals(romanNumber, it)]
        c <= arabicNumber
    }
    
    @Test
    def test_to_roman() {
        test_to_roman(1, 'I')
        test_to_roman(4, "IV")
        test_to_roman(1984, "MCMLXXXIV")
        test_to_roman(2015, "MMXV")
    }
}