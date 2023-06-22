def two_sum(numbers, target)
  result = 0
  
  numbers.each.with_index do |number, i|
    for j in (i+1)..(numbers.length - 1) do
      if numbers[j]
        result = (number + numbers[j])
        if result == target
          return [i, j]
        end
      end
    end
  end
end