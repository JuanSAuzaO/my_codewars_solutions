def around_fib(p)
  sum = 0
  mem = 0
  count = {}
  max_count = 0
  digit = 0
  
  for i in 0..p
    if i == 1
      sum += 1
    else
      sum = mem + sum
      mem = sum - mem
    end
  end
  
  sum_s = sum.to_s
  chunk_size = 25
  split_number = sum_s.chars
  
  split_number.each do |number|
    count[number] ||= split_number.count(number)
  end
  
  count.each do |num, cnt|
    if cnt > max_count
      max_count = cnt
      digit = num
    elsif cnt == max_count && num.to_i < digit.to_i
      digit = num
    end
  end
  
  chunks = split_number.each_slice(25).map(&:join)
  
  return "Last chunk #{chunks[-1]}; Max is #{max_count} for digit #{digit}"
end