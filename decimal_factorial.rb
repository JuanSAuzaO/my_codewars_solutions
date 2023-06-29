# Link to challenge instructions: https://www.codewars.com/kata/54e320dcebe1e583250008fd

def dec_2_fact_string(nb)
  a = nb # 1.1 Here we store a copy of the input number to encode.
  b = 1 # 1.2 This will be used as a divider later.
  c = 1 # 1.3 This will be used as a reference for performing module operations.
  # 1.4 Here we'll add up the decimals that compose the encoded factorial in reverse order.
  num = ""
  # 1.5 We may need to encode with alphabet letters if remainder of module is greater than 9. 
  alphabet = ("A".."Z").to_a
  # 1.6 These numbers will be linked to the alphabet letters.
  codes = (10..35).to_a
  # 1.7 This hash will link each number to its respective letter.
  relation = {}
  
  codes.each.with_index do |num, i| # 2 We iterate over codes array:
    # and create an entry in relation hash per each number with the alphabet letter as value.
    relation[num] = alphabet[i]
  end
  
  # 3 We start a while loop until the result is greater than or equal to 1.
  while a / b >= 1 
    a = a / b # First we divide the current value of a into b.
    mod =  a % c # Then we get the remainder from a module c and save it to mod.
    if mod >= 10 # If remainder is greater than or equal to 10
      num += relation[mod] # We add the letter linked to the mod value.
    else # If it is lower than 10
      num += mod.to_s # We add the mod value.
    end
    # If it is the first iteration we don't increase b value, otherwise we increase it by 1.
    c == 1 ? b = 1 : b += 1 
    c += 1 # We increase c value by 1.
  end
  
  str = num.reverse # 4 We reverse the number obtained from the loop.
  
  return str # 5 And return the answer.
  
end

def fact_string_2_dec(str)
  num = str.reverse # 1.1 Here we store the encoded factorial and we reverse it to obtain
  # the remainders from the module operations in the encoding function.
  a = 0 # 1.2 for the moment the decoded number value is unknown, so we set 0.
  b = str.length - 1 # 1.3 It was the biggest divider achieved encoding.
  c = b + 1 # 1.4 According to encoding function, c was one step ahead of b.
  alphabet = ("A".."Z").to_a # 1.5 We will need to decode alphabet letters this time.
  codes = (10..35).to_a # 1.6 with their linked numbers.
  relation = {} # 1.7 Here we link each letter to its respective number.
  
  alphabet.each.with_index do |let, i| # 2 This time we iterate over alphabet array
    # and create an entry in relation hash for each letter with its respective number as value.
    relation[let] = codes[i]
  end
  
  # 3 We start a while loop until c reaches its minimum value.
  while c > 1
    # First we check if the coded character is a letter
    if num[b].match?(/[[:alpha:]]/)
      # If so we look for the number that represents the remainder so we can later reverse module operation.
      number = relation[num[b]]
      # We add a the value of reminder and then we multiply it by b.
      a = (a + number.to_i) * b
    elsif num[b].match?(/[[:digit:]]/) # In case it is a digit.
      # We just add the remainder value and multiply it by b.
      a = (a + num[b].to_i) * b 
    end
    
    c -= 1 # We reduce c value.
    b -= 1 # We reduce b value.
    # and repeat until a gets its original value.
  end
  
  return a # 4 and we return the answer.
end