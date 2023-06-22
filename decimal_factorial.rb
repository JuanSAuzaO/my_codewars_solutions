def dec_2_fact_string(nb)
  a = nb
  b = 1
  c = 1
  num = ""
  alphabet = ("A".."Z").to_a
  codes = (10..35).to_a
  relation = {}
  
  codes.each.with_index do |num, i|
    relation[num] = alphabet[i]
  end
  
  while a / b >= 1
    a = a / b
    mod =  a % c
    if mod >= 10
      num += relation[mod]
    else
      num += (a % c).to_s
    end
    
    c == 1 ? b = 1 : b += 1
    c += 1
  end
  
  str = num.reverse
  
  return str
  
end

def fact_string_2_dec(str)
  num = str.reverse
  a = 0
  b = str.length - 1
  c = b + 1
  alphabet = ("A".."Z").to_a
  codes = (10..35).to_a
  relation = {}
  
  alphabet.each.with_index do |let, i|
    relation[let] = codes[i]
  end
  
  while c > 1

    if num[b].match?(/[[:alpha:]]/)
      number = relation[num[b]]
      a = (a + number.to_i) * b
    elsif num[b].match?(/[[:digit:]]/)
      a = (a + num[b].to_i) * b
    end
    
    c -= 1
    c - 1 == 0 ? b == 1 : b -= 1
  end
  
  return a
end