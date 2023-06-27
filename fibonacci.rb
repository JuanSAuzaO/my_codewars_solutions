# Link to challenge to check instructions: https://www.codewars.com/kata/59bf943cafcda28e31000130

def around_fib(p)
  sum = 0 # 1.1 Here we will store the result from fibonacci(n)
  mem = 0 # 1.2 Here we will store a copy of previous result from sum.
  count = {} # 1.3 Here we will store the count per each digit of the resulting number from fibonacci(n)
  max_count = 0 # 1.4 Here we will store the max count of a digit.
  digit = 0 # 1.5 Here we will store the digit with the max count.
  
  for i in 0..p # 2 We start an iteration to calculete fibonacci(n)
    if i == 1 # a If reference index is 1, we add up 1 because fibonacci(1) = 1.
      sum += 1
    else # b If reference index is greater, we need to begin to sum the current number plus the previous one.
      sum = mem + sum
      mem = sum - mem # This is way we store the value we had before the sum, so we can follow the fibonacci's sequence rule.
    end
  end
  
  sum_s = sum.to_s # 3.1 We turn the sum result to string.
  split_number = sum_s.chars # 3.3 We create an array with each digit from the sum variable.
  
  split_number.each do |number| # 4 We start an iteration over the array we just created.
    count[number] ||= split_number.count(number) # adding the number of times certain digit repeats.
  end
  
  count.each do |num, cnt| # 5 We start an iteration over the count hash:
    if cnt > max_count # (a) If a count is greater than the max_count registered:
      max_count = cnt # We give max_count the value of current count.
      digit = num # and assign the digit with the record.
    elsif cnt == max_count && num.to_i < digit.to_i # (b) If a count happens to be equal to the max count
      digit = num # and the digit comes first in natural numbers order, then we assign its digit.
    end
  end
  
  chunks = split_number.each_slice(25).map(&:join) # 6 We cut our split number array to sub arrays with max length 25, then we 
  # apply map method, to create a new array, that will contain each slice joined to an string.
  
  return "Last chunk #{chunks[-1]}; Max is #{max_count} for digit #{digit}"
  #7 Finally, we present the last chunk from the chunks array, the max_count record and the digit that holds the record, all in a string. 
end