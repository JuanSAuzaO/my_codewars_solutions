# Link to challenge to check instructions: https://www.codewars.com/kata/5a4331b18f27f2b31f000085

# Challenge creator gives us three arrays containing the alphabet, consonants and vowels respectevely.
Alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
Consonants = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'];
Vowels = ['a','e','i','o','u'];

def replace_letters(word)
  word_array = word.split("") #1 We separate each letter of the input string into an array.
  new_word = "" #2 We declare the variable to return at the end with the edited word.
  word_array.each do |letter| #3 We start an iteration over the array to edit each letter according to instructions.
    start_index = Alphabet.index(letter) #4 We locate the index of each letter in the alphabet.
    alphabet_array = Alphabet[start_index..] + Alphabet[0..start_index] # 5 we start a new array from the letter we got and then we include all other letters from the alphabet to the right.
    if Consonants.include?(letter) # 6.a Is the letter a consonant?
      alphabet_array.each do |string| # 7.a In this case we iterate over the new array to verify what is the next vowel in the alphabet
        if Vowels.include?(string)    # from our position, once we find it, we add it to our "new_word" answer variable.
          new_word += string
          break
        end  
      end
    elsif Vowels.include?(letter)  # 6.b Or is the letter a vowel?
      alphabet_array.reverse_each do |string| # 7.b In this case we iterate backwards over the new array  to verify what is the previous 
        if Consonants.include?(string)        # vowel in the alphabet from our position, once we find it, we add it to our "new_word" answer variable.
          new_word += string
          break
        end    
      end
    end
  end
  return new_word #8. After we finish the procedure to each letter, we just return the answer.
end

p replace_letters("sebastian")