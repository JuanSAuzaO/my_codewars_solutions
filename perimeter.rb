# Link to challenge instructions: https://www.codewars.com/kata/559a28007caad2ac4e000083

def perimeter(n)
  squares = n + 1 # 1.1 First we define the number of squares we will have according to instructions.
  sequence = [] # 1.2 Here we will define the numbers of the fibonacci sequence.
  result = 0 # 1.3 The variable we will return at the end.
  for i in 0..n # 2 We start an iteration to get the numbers from the fibonacci sequence
    if sequence.length == 0 # 3.a If we don't have anything yet, we start the sequence by adding 0 and 1.
      sequence.push(0)
      sequence.push(1)
      result += 1 # we add 1 to the cumulated value.
    else # 3.b If we already have numbers, we start summing the value of the previous number and the current one.
      sum = (sequence[i-1] + sequence[i])
      sequence.push(sum) # We push the result of the sum to continue the sequence.
      result += sum # We add the number obtained from the sum to the cumulated value.
    end

  end

  return result * 4 # 4 Finally we obtain the perimeter by multiplying the summ of all numbers per 4.
end

p perimeter(30)