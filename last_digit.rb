def last_digit(n1, n2)
  known_results = {}
  count = []
  pattern_start= 9
  last_digit =  n1.to_s[-1].to_i
  
  for i in 0..9
    known_results[i] = (n1 ** i).to_s[-1]
  end
  
  known_results.each do |pow, dig|
    count.push(dig) if !count.include?(dig)
  end
  
  o_length = count.length
  
  count.shift if count.length > 4
  
  pattern_index = count.length
  
  if last_digit != 0 && last_digit != 1 && last_digit != 5 && last_digit != 6 && n2 != 0
    case n2 % pattern_index
      when 0
        if o_length > 4
          return count[-1].to_i
        else
         return count[0].to_i
        end
      when 1
        if o_length > 4
          return count[0].to_i
        else
         return count[1].to_i
        end
      when 2
        if o_length > 4
          return count[1].to_i
        else
          return count[2].to_i
        end
      when 3
        if o_length > 4
          return count[2].to_i
        else
          return count[3].to_i
        end
    end
  elsif n2 == 0
    return 1
  else
    return last_digit
  end
end