# Link to challenge to check instructions: https://www.codewars.com/kata/5dad6e5264e25a001918a1fc

def decode(r)
  alphabet = ("a".."z").to_a # 1.1 We set an alphabet array from a range including all letters.
  number = "" # 1.2 Here we'll catch the number from the input string.
  letters = "" # 1.3 Here we'll catch the letters from the input string.
  decoded_s = "" # 1.4 Variable to return the final result.

  
  r.each_char do |char| # 2 We iterate the input string:
    if char !~ /\D/ #  We are going to check if each character is a digit or no, using a regex.
      number += char # We add each of them to their corresponding variable according to its condition (number or letter).
    else
      letters += char
    end
  end
  
  letters.each_char do |letter| # 3 Once we have the coded letters, we start an iteration to decode them:
    coded_i = alphabet.index(letter) # 3.1 We identify each letter index in the alphabet array and save it to "coded_i" variable.
    n = 0 # 3.2 n represents the iterations over the alphabet, each iteration represents a 26 increase in its value.
    matches = [] # 3.3 Matches will contain the decoded letters index.

    if (number.to_i % 26.0) == 0 # We return Impossible to decode if the divider equals 0, cause the formula needed to
      return "Impossible to decode" # get the decoded letter index will require a division.
    end
    
    decoded_i = (coded_i + n) / (number.to_i % 26.0) # 4 We reverse the formula from the encoding instructions to get
                                                     # the decoded letter index.
    if decoded_i.round == decoded_i # 5 We verify that resultant decoded letter index is an integer.
      matches.push(decoded_i)       # in such case we consider it a match, so we push the index to the array.
    end

    while decoded_i < 26 # 6 We need to make sure, that the letter we got is the only possible result,
      n += 26            # so we simulate to start the alphabet over again by increasing n value by 26
      decoded_i = (coded_i + n) / (number.to_i % 26.0)  # and process the formula again to check if it matches 
      if decoded_i.round == decoded_i && decoded_i < 26 # other letter when decoding.
        matches.push(decoded_i)
      end
    end

    if matches.length > 1 # 7 If it actually matches other letter in the alphabet, there can't be precision
      return "Impossible to decode" # when decoding so we return "Impossible to decode"
    end

    if matches.length == 1 # 8 If there is only one match, we find it in the alphabet by its index
      s = alphabet[matches[0]] # and add it to the result variable.
      decoded_s += s
    end
  end

  return decoded_s # 9 Finally we return the result variable.
end

p decode("3107754aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")