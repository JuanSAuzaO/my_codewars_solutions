# Link to challenge to check instructions: https://www.codewars.com/kata/5463c8db865001c1710003b2

def number_to_english(n)
  
  number = "" # 1 Here we will return the numbers in English.
  
  return number if n.round != n || n < 0 # 2 We will return nothing if number is not integer or if it is negative.
  
  digits = (0..9).to_a # 1.1.1 We create an array containing digits from 0 to 9.
  # 1.1.2 and other array with their respective names in english.
  names = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"] 
  special = (11..19).to_a # 1.2.1 We create other array containing numbers from 11 to 19.
  # 1.2.2 and an array with respective names again.
  special_names = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  tens = (10..90).step(10).to_a # 1.3.1 We create other array containing tens from 10 to 90.
  # 1.3.2 and the array with respective names again.
  tens_names = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
  # 1.4 We create an array with 00 and 000 extensions.
  extensions = ["hundred", "thousand"]
  numbers = {} # 1.5 Here we will store each number name for each value so we can access them later.
   
  digits.each_with_index do |digit, i| # 2 We iterate over digits array
    numbers[digit] = names[i] # and assign them a name in the numbers hash.
  end
  
   special.each_with_index do |number, i| # 3 Now we iterate on the numbers from 11 to 19
    numbers[number] = special_names[i] # and assign them names.
  end
  
  tens.each_with_index do |ten, i| # 4 We complete the numbers hash:
    numbers[ten] = tens_names[i] # by assigning tens' names.
  end

  string = n.to_s # 5 We turn the input number to string so we can iterate later.
  
  length = string.length # 6 We save the length of the number.
  
  string.each_char.with_index do |digit, i| # 7 we start an indexed iteration over the string:
    
    case length # 8 and we begin a "case" conditional because we have multiple options to go
      when 1 # When we just have one digit, we just retrieve its name from the hash
        number += numbers[digit.to_i] # and add it to the answer variable.
      when 2 # With two digits it gets a bit tricky:
        if tens.include?(string[-2, 2].to_i) # We first check if number is part of tens array.
          return number += numbers[string[-2, 2].to_i] # If so we just add its name and return the answer.
        elsif special.include?(string[-2, 2].to_i) # Number might be between 11 and 19.
          return number += numbers[string[-2, 2].to_i] # So we would add its name and return answer.
        elsif string[-2, 2].to_i == 0 # if coming from a hundred remaining number is 00
          return number.chomp(" ") # We would just remove last space and return answer.
        elsif digit.to_i != 0 # If digit is not 0: 
          number += numbers[digit.to_i * 10] + " " # We add it as a tenth to english.
          # We reduce length variable so we can now process the last digit with the code stated in case one. 
          length -= 1 
        else # If digit is a 0:
          length -= 1 # we just ignore it and go to the last digit.
        end 
      when 3 # With three digits:
        # We first get sure the current index addresses the third digit from right to left.
        if i == string.length - 3
          if string[-3, 3].to_i == 0 # If coming from a thousand remaining number is 000
            return number.chomp(" ") # We just withdraw last space and return answer.
          elsif digit.to_i != 0 # If digit is not 0:
            number += "#{numbers[digit.to_i]} #{extensions[0]} " # We just add it accompanied by its hundred extension.
            length -= 1 # We reduce the length so we process the last two digits.
          else # If digit is 0:
            length -= 1 # We just ignore it and go to last two digits.
          end
        end
      when 4 # With 4 digits:
          number += "#{numbers[digit.to_i]} #{extensions[1]} " # We just add it with its thousand extension.
          length -= 1 # and reduce length to continue processing last three digits.
      when 5 # With 5 digits process is similar to 2 digits:
        if tens.include?(string[0,2].to_i) # If first two digits are part of tens array.
          # We add it and reduce the number length by 2 so we can continue processing last three digits.
          number += "#{numbers[string[0,2].to_i]} #{extensions[1]} "
          length -= 2
        elsif special.include?(string[0,2].to_i) # If first two digits are between 11 and 19.
          # add name and reduce length by 2.
          number += "#{numbers[string[0,2].to_i]} #{extensions[1]} " 
          length -= 2
        else
          # any other case just add the tenth and reduce length by 1 to continue processing 4 last digits. 
          number += numbers[digit.to_i * 10] + " "
          length -= 1
        end
    end
  end
  
  return number # 9 After all validations return final answer.
  
end

p number_to_english(12654)