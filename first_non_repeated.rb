def  first_non_repeating_letter(s)
  count = {}
  copy = s.downcase
  
  s.each_char do |char|
    if copy.count(char.downcase) == 1
      return count[1] = char
    end
  end
  
  return ""
end