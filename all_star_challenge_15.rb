# Link to challenge instructions: https://www.codewars.com/kata/586560a639c5ab3a260000f3

def rotate(str)
  array = [] # 1.1 We define the array that will contain the result.
  new = str # 1.2 We make a copy of the original string.
  str.each_char.with_index do |char, i| # 2 We iterate over the original string.
    # Only the copy will suffer the changes, so we don't affect the slicing process.
    new = new.slice(1, new.length - 1) # 3 we withdraw the first letter.
    new += char # 4 and add it to the end.
    array.push(new) # 5 and finally we push the edited version of the string copy.
  end
  
  return array # 6 We return the result with all the combinations.
end