def soundex(names)
  
  names.downcase!
  names_array = names.split(" ")
  mem = {}
  
  for i in 0..(names_array.length - 1) do
    mem[i] = names_array[i][0].upcase
  end
  
  digit_1 = ["b", "f", "p", "v"]
  digit_2 = ["c", "g", "j", "k", "q", "s", "x", "z"]
  digit_3 = ["d", "t"]
  digit_4 = ["l"]
  digit_5 = ["m", "n"]
  digit_6 = ["r"]
  v_sound = ["a", "e", "i", "o","u", "y"]
  special = ["h", "w"]

  erased = 0
  
	names.each_char.with_index do |char, i|
    if i != 0 && names[i-erased-1] != " " && special.include?(char)
      names.slice!(i - erased)
      erased += 1
    end
    
    if digit_1.include?(char)
      names[i - erased] = "1"
    elsif digit_2.include?(char)
      names[i - erased] = "2"
    elsif digit_3.include?(char)
      names[i - erased] = "3"
    elsif digit_4.include?(char)
      names[i - erased] = "4"
    elsif digit_5.include?(char)
      names[i - erased] = "5"
    elsif digit_6.include?(char)
      names[i - erased] = "6"
    end
  end
  
  names = names.gsub(/(\d)\1+/, '\1')
  
  erased = 0
  
  names.each_char.with_index do |char, i|
    if i != 0 && names[i-erased-1] != " " && v_sound.include?(char)
      names.slice!(i - erased)
      erased += 1
    end
  end
  
 names_array = names.split(" ")
  
 for i in 0..(names_array.length - 1)
    names_array[i][0] = mem[i]

    names_array[i] += "000"

    names_array[i] = names_array[i][0, 4]
 end

  names = names_array.join(" ")
  
  return names
end