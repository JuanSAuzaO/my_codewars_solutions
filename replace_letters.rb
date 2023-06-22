Alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
Consonants = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'];
Vowels = ['a','e','i','o','u'];

def replace_letters(word)
  word_array = word.split("")
  new_word = ""
  word_array.each do |letter|
    start_index = Alphabet.index(letter)
    alphabet_array = Alphabet[start_index..] + Alphabet[0..start_index]
    if Consonants.include?(letter)
      alphabet_array.each do |string|      
        if Vowels.include?(string)
          new_word += string
          break
        end  
      end
    elsif Vowels.include?(letter)
      alphabet_array.reverse_each do |string|
        if Consonants.include?(string)
          new_word += string
          break
        end    
      end
    end
  end
  return new_word
end

p replace_letters("sebastian")