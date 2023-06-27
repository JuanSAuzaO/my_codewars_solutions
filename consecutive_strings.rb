#Link to the challenge to check instructions: https://www.codewars.com/kata/56a5d994ac971f1ac500003e

def longest_consec(strarr, k)
  results = [] # 1.1 Here we will place the results from concatenating "k" number of elements from "strarr" array.
  record = "" # 1.2 Here we will place the first longest concatenation.
  
  if strarr.length == 0 || k > strarr.length || k <= 0 # 2.a Here we specify the invalid cases.
    return "" # 3.a so we return nothing.
  elsif k == 1 # 2.b In case we don't have to concatenate the elements:
    strarr.each do |str| # 3.b We start an iteration over the array.
      if str.length > record.length # We just look for the longest individual element.
        record = str # If the current string is longer than any previous one, then it should become the record. 
      end
    end
  else # 2.c In case we have to concatenate the elements.
    chances = strarr.length - (k.to_f - 1) # We first need to calculate the total of possible combinations according to the input.
    index = 0 # We start from a zero index.
    for i in 1..chances do # 3.c Then we start a double iteration, the parent one will be a for loop with i reference index.
      j = 1                # We create a j reference index for the second loop.
      
      concatenation = ""   # We create a variable that will hold the result of the concatenation with "k" length.
      while j <= k         # The child interation is a while loop.
        concatenation += strarr[index] if strarr[index] # At each child iteration we add an element of the array to the concatenation
        index += 1                                      # variable whenever it exists, and we raise both index and j values until j is
        j += 1                                          # equal to k value, once j exceeds k we stop the loop.
      end
      results.push(concatenation) # We push the resulting concatenation to the results array.
      index = i                   # and finally we reset the index to the position of the string that was next, following the array order.
    end


    results.each do |concatenation| # 4 We iterate over the results array containing all possible combinations.
      if concatenation.length > record.length # and look for the one with the longest one. It will just place the first 
        record = concatenation                # with the biggest length, because it is conditioned using a ">", not ">="
      end
    end
  end

return record # 5 We return the result
  
end