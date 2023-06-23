#Link to the challenge to check instructions: https://www.codewars.com/kata/5a5cdb07fd56cbdd3c00005b

def find_dups_miss(arr)
  base = {} #1 We will store in a hash each number from the Input array. We choose a hash because the number might be very big.
  duplicates = [] #2 We will store here any repeated number.
  min = arr.min #3 Here we return both the minimum and maximum number from the input.
  max = arr.max
  complete_array = (min..max).to_a #4 Here we create the whole number sequence from minimum to maximum using a range.
  missing_value = complete_array - arr #5 If we substract all the Input array values from the complete sequence we obtain the missing value.
  arr.each do |number| #6 We start iterating the input array.
    if !base[number] # If there is no registry in the base hash, we create it.
      base[number] = number
    else
      duplicates.push(number) #If there was a registry with same number already, we add it to duplicates.
    end
  end

  return [missing_value[0], duplicates.sort] #7 Finally we return an array with the missing value, and an array with the sorted duplicates.
end