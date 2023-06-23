#Link to the challenge to check instructions: https://www.codewars.com/kata/58ae6ae22c3aaafc58000079

def permute_a_palindrome(input)
  odd = {} #1 Here we will store "true" for any character that may have an odd count in the input.
  if input.length.odd? #2 We verify if the input has an even or an odd length.
    input.each_char do |char| #3.a In case it is odd we need to get sure there is only 1 character with an odd count.
      if !input.count(char).even? # So we iterate over the input checking for odd count characters, in such case, we add them to the hash. 
        odd[char] ||= true
      end
    end
    if odd.length > 1 # 4.a If for some reason there is more than one odd count character, we cannot permute palindromes, so we return false.
      return false
    else # If there is only one odd count character, we can permute palindromes.
      return true
    end
  else
    input.each_char do |char| #3.b In case input length is even we need to get sure there is not a single odd count character.
      if !input.count(char).even? # So we iterate over the input checking for an odd count character, if it exists, we add it to the hash and stop the loop.
        odd[char] = true
        break
      end
    end
    if odd.length > 0 # 4.b If there is an odd count character, we cannot permute palindromes.
      return false 
    else
      return true # If there are not any odd count characters, we can permute palindromes.
    end
  end
end