def dig_pow(n, p)
  sum = 0.0
  
  n.to_s.each_char do |digit|
    sum += digit.to_i ** p
    p += 1
  end
  
  k = (sum / n)
  
  if k.round == k
    return k.to_i
  else
    return -1
  end
end