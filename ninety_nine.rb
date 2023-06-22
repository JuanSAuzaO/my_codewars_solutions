def number_to_english(n)
  
  number = ""
  
  return number if n.round != n || n < 0
  
  digits = (0..9).to_a
  names = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  special = (11..19).to_a
  special_names = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  tens = (10..90).step(10).to_a
  tens_names = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
  extensions = ["hundred", "thousand"]
  numbers = {}
  
   
  digits.each_with_index do |digit, i|
    numbers[digit] = names[i]
  end
  
   special.each_with_index do |number, i|
    numbers[number] = special_names[i]
  end
  
  tens.each_with_index do |ten, i|
    numbers[ten] = tens_names[i]
  end

  string = n.to_s
  
  length = string.length
  
  string.each_char.with_index do |digit, i|
    
    case length
      when 1
        number += numbers[digit.to_i]
      when 2
        if tens.include?(string[-2, 2].to_i)
          return number += numbers[string[-2, 2].to_i]
        elsif special.include?(string[-2, 2].to_i)
          return number += numbers[string[-2, 2].to_i]
        elsif string[-2, 2].to_i == 0
          return number.chomp(" ")
        elsif digit.to_i != 0
          number += numbers[digit.to_i * 10] + " "
          length -= 1
        else
          length -= 1
        end
      when 3
        if i == string.length - 3
          if string[-3, 3].to_i == 0
            return number.chomp(" ")
          elsif digit.to_i != 0
            number += "#{numbers[digit.to_i]} #{extensions[0]} "
            length -= 1
          else
            length -= 1
          end
        end
      when 4
        if string[-4, 4].to_i == 0
          return number.chomp(" ")
        else
          number += "#{numbers[digit.to_i]} #{extensions[1]} "
          length -= 1
        end
      when 5
        if tens.include?(string[0,2].to_i)
          number += "#{numbers[string[0,2].to_i]} #{extensions[1]} "
          length -= 2
        elsif special.include?(string[0,2].to_i)
          number += "#{numbers[string[0,2].to_i]} #{extensions[1]} "
          length -= 2
        else
          number += numbers[digit.to_i * 10] + " "
          length -= 1
        end
    end
  end
  
  return number
  
end

p number_to_english(15122)