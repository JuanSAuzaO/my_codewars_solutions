def permute_a_palindrome(input)
  even = []
  odd = []
  if input.length.odd?
    input.each_char do |char|
      if !input.count(char).even?
        odd.push(true)
      end
    end
    if odd.length > 1
      even = []
      middle_index = (input.length - 1) / 2
      input.slice!(middle_index)
      input.each_char do |char|
        if
          even.push(true)
        else
          even.push(false)
        end
        if even.include?(false)
          return false
        else
          return true
        end
      end
    else
      return true
    end
  else
    input.each_char do |char|
      if input.count(char).even?
        even.push(true)
      else
        even.push(false)
      end
    end
    if even.include?(false)
      return false
    else
      return true
    end
  end
end