arr = (1..100000).to_a
arr.delete(6456)
arr = [24,25,34,40,38,26,33,29,50,31,33,56,35,36,53,49,57,27,37,40,48,44,32,35,45,52,43,47,26,51,55,28,41,42,46,51,25,30,44,54]

def find_dups_miss(arr)
  base = {} ## It is way faster to store data in Hashes than arrays.
  duplicates = []
  min = arr.min
  max = arr.max
  complete_array = (min..max).to_a
  missing_value = complete_array - arr
  arr.each do |number|
    if !base[number]
      base[number] = number
    else
      duplicates.push(number)
    end
  end

  return [missing_value[0], duplicates.sort]
end