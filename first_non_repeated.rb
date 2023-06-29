# Link to challenge instructions: https://www.codewars.com/kata/52bc74d4ac05d0945d00054e

def  first_non_repeating_letter(s)
  copy = s.downcase # 1 We save a lower case copy of the input string.
  
  s.each_char do |char| # 2 We start an iteration over the input string.
    # We check the count of each character. Character must only appear once:
    if copy.count(char.downcase) == 1 # Appearances are case insensitive.
      # But anyway we must return the character in the original case.
      return char
    end
  end
  # If a string contains all repeating characters or a invalid input, we return nothing.
  return "" 
end