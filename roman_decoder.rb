#Link to the challenge to check instructions: https://www.codewars.com/kata/51b6249c4612257ac0000005

def solution(roman)
  #1 We a set a database hash with the information provided with the author.
  database = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }
  value = 0 #2 We create a value variable to return the final answer.
  roman.each_char.with_index do |letter, i| #3 We iterate over the input string to add each symbol value to the previously created variable.
    if database[letter.to_sym] #3.1 We verify that the input provided is actually a roman symbol.
      # There are roman numbers composed of two symbols, so we need to be careful on verifying the values.
      if letter == "I" && roman[i+1] == "V" && i != roman[-1] # 3.2.a We will check if between our current index and the next we compose a IV(4)
      # Also we are checking the current index is not the last one, otherwise it would take us again to the beginning of the string.  
        value += 4 #3.2.a We add the corresponding value of the symbols combination.                                          
      elsif letter == "V" && roman[i-1] == "I" && i != 0 # 3.2.b If we previously formed a IV(4) we need to rest assured the iteration of
      # the second symbol is ignored, also we are checking the current index is not the first one, otherwise it would take us back to the 
      # end of the string.
        value += 0
      elsif letter == "I" && roman[i+1] == "X" && i != roman[-1] #3.2.c In this case we composed a IX(9) from two symbols.
        value += 9
      elsif letter == "X" && roman[i-1] == "I" && i != 0 #3.2.d Same as before, if we previously composed a IX(9), the second symbol must
        # be ignored.
        value += 0
      else
        value += database[letter.to_sym] #3.2.e For the rest of the cases we just add the individual symbol's value.
      end
    end
  end
  return value #4 And finally return the result.
end