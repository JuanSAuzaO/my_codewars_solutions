# Link to challenge to check instructions: https://www.codewars.com/kata/587319230e9cf305bb000098

def soundex(names)
  
  # 1.1 We will use lower case during the process except for the first letter of each name.
  names.downcase!
  # 1.2 We separate each name in an array(If there are more than one).
  names_array = names.split(" ")
  mem = {} # 1.3 Here we will store the first letter of each name.
  
  for i in 0..(names_array.length - 1) do # 2 We iterate over the names array:
    mem[i] = names_array[i][0].upcase # Saving the first letter of each name in uppercase.
  end
  
  # 3 According to instructions we must classify the letters of the alphabet this way
  # digit arrays mean that each letter will be replaced by a number in the process.
  digit_1 = ["b", "f", "p", "v"]
  # for example "c" == 2 because is part of array "digit_2"
  digit_2 = ["c", "g", "j", "k", "q", "s", "x", "z"] 
  digit_3 = ["d", "t"]
  digit_4 = ["l"]
  digit_5 = ["m", "n"]
  digit_6 = ["r"]
  v_sound = ["a", "e", "i", "o","u", "y"]
  special = ["h", "w"]

  erased = 0 # Here we will keep a record of times we have withdrawn letters from string.
  
	names.each_char.with_index do |char, i| # 4 We start an iteration over names string:
    # 4.1 We verify if this is not the first letter of neither the string nor any name.
    # In compliance with the above, we check if there is either an h or a w.
    if i != 0 && names[i-erased-1] != " " && special.include?(char)
      names.slice!(i - erased) # If so we need to withdraw it.
      # We keep a record of erased, because string indexes change everytime we withdraw a letter.
      erased += 1
      # And at each iteration, it is going to check if something was previously erased,
      # to alter addressed index.
    end
    
    # 4.2 Now we are classifying the rest of the consonants according to digit arrays:
    if digit_1.include?(char)
      # Changing each letter in string per its corresponding digit.
      names[i - erased] = "1"
    elsif digit_2.include?(char)
      names[i - erased] = "2"
    elsif digit_3.include?(char)
      names[i - erased] = "3"
    elsif digit_4.include?(char)
      names[i - erased] = "4"
    elsif digit_5.include?(char)
      names[i - erased] = "5"
    elsif digit_6.include?(char)
      names[i - erased] = "6"
    end
  end
  
  # 5 We use global substitute method to replace any repeated adjacent numbers,
  # with only one of them.
  names = names.gsub(/(\d)\1+/, '\1')
  
  erased = 0 # We reset the erased record, because we'll perform another loop.
  
  names.each_char.with_index do |char, i| # 6 We iterate over names string again:
    # This time we check for vowel sound letters that are not the first letter
    # of neither the string nor any name
    if i != 0 && names[i-erased-1] != " " && v_sound.include?(char)
      names.slice!(i - erased) # In such case we withdraw them.
      erased += 1 # and add one to erased registry.
    end
  end
  
  # 7 We reset our names array to one with the edited elements.
  names_array = names.split(" ") 
  
 for i in 0..(names_array.length - 1) # 8 Now we iterate the reset names array:
    names_array[i][0] = mem[i] # Assigning each name its first letter.

    names_array[i] += "000" # Adding it three zeros.

    # And just showing the first letter with 3 digits to the right.
    names_array[i] = names_array[i][0, 4]
 end

  # 9 We join the names array to form a string and save it to names.
  names = names_array.join(" ")
  
  # 10 We return the final result.
  return names
end