#Link to the challenge to check instructions: https://www.codewars.com/kata/5552101f47fc5178b1000050

def dig_pow(n, p)
  sum = 0.0 # 1 Here we will add the result of each digit to the power of "p".
  
  n.to_s.each_char do |digit| # 2 We iterate each digit from the "n" input number.
    sum += digit.to_i ** p # 3 we add the result of the power as stated in the beginning.
    p += 1 # 4 We increase p's value by 1 on each iteration.
  end
  
  k = (sum / n) # 5 We divide the result of the sum into the input number to get "k".
  
  if k.round == k # 6.a if the result is an integer we return k. Because sum has to be multiplo of n.
    return k.to_i
  else            # Otherwise we return "-1".
    return -1
  end
end