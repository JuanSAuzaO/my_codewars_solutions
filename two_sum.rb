# Link to challenge instructions: https://www.codewars.com/kata/52c31f8e6605bcc646000082

def two_sum(numbers, target)
  result = 0 # 1 We set the variable to check each sum result.
  
  numbers.each.with_index do |number, i| # 2 We start an iteration over numbers array with i reference index.
    for j in (i+1)..(numbers.length - 1) do # 3 And another iteration inside with a for loop with j reference index.
    # This is because we need to try different options to add up with each number of the parent iteration.
      if numbers[j] # We first check if next number exists. Because j shall start one step ahead of i.
        result = (number + numbers[j]) # We sum the current number from the first iteration and the option provided by the second.
        if result == target # If result equals to target defined in the input.
          return [i, j]  # We return the indexes of the numbers that composed the sum for the result.
        end
      end
    end
  end
end