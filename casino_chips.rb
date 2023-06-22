def solve arr 
  min = arr.min
  max = arr.max
  med = (arr.select.with_index { |num, i| i != arr.index(min) && i != arr.rindex(max) })[0]

  total_chips = min + med + max # [12, 12, 12,] => 12 + 12 + 12 

  max_days = total_chips / 2

  if (min + med) >= max
    days = (min + med) / 2.0 + max / 2.0
  else
    days = min + med
  end

  return days.to_i
end

p solve([1,1,1])