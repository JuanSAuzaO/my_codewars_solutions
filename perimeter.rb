def perimeter(n)
  squares = n + 1
  sequence = []
  result = 0
  for i in 0..n
    if sequence.length == 0
      sequence.push(0)
      sequence.push(1)
    else
      sum = (sequence[i-1] + sequence[i])
      sequence.push(sum)
    end

  end

  sequence.each do |number|
    result += number
  end

  return result * 4
end

p perimeter(30)