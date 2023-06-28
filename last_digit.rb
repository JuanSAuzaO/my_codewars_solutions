# Link to challenge to check intructions: https://www.codewars.com/kata/5511b2f550906349a70004e1

def last_digit(n1, n2)
  # 1.1 Here we will store the last digit of results from the first 9 powers of n1(base number)
  # to identify a pattern.
  known_results = {}
  # 1.2 Here we will push the digits that compose the pattern.
  count = []
  last_digit =  n1.to_s[-1].to_i # 1.3 Here we identify the last digit of n1.
  
  for i in 0..9 do # 2 We perform a for loop:
    known_results[i] = (n1 ** i).to_s[-1] # Raising n1 to the power of i(0-9) and pushing each result.
  end
  
  known_results.each do |pow, dig| # 3 We iterate known_results hash:
    # If the digit wasn't in count array before, appears more than once in the hash, and power is not 0:
    if !count.include?(dig) && known_results.values.count(dig) > 1 && pow != 0 
      count.push(dig) # We include it in the count array as part of the pattern.
    end
  end

  pattern_index = count.length # 4 Here we express how long the pattern is, it can't be longer than 4.
  
  # 5.a When last digit of base is either 0, 1, 5 or 6 result's last digit will be the same. 
  if last_digit != 0 && last_digit != 1 && last_digit != 5 && last_digit != 6 && n2 != 0
    # 5.b Otherwise, we need to calculate the n2(power exponent) module pattern_index:
    case n2 % pattern_index
      # If remainder is 0, we return the last digit of the pattern.
      when 0
         return count[-1].to_i
      when 1
      # If remainder is 1, we return the first digit of the pattern.
         return count[0].to_i
      when 2
      # If remainder is 2, we return the second digit of the pattern.
          return count[1].to_i
      when 3
      # If remainder is 3, we return the third digit of the pattern.
          return count[2].to_i
      end
  elsif n2 == 0 # 5.c When n2 is 0 we return 1.
    return 1
  else
    return last_digit # we return last digit as stated in step 5.a
  end
end

p last_digit(2, 200)