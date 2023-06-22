def longest_consec(strarr, k)
  results = []
  record = ""
  
  if strarr.length == 0 || k > strarr.length || k <= 0
    return ""
  elsif k == 1
    strarr.each do |str|
      if str.length > record.length
        record = str
      end
    end
  else
    chances = strarr.length - (k.to_f - 1)
    index = 0
    for i in 1..chances do
      j = 1
      
      concatenation = ""
      while j <= k
        concatenation += strarr[index] if strarr[index]
        index += 1
        j += 1
      end
      results.push(concatenation)
      index = i
    end


    results.each do |concatenation|
      if concatenation.length > record.length
        record = concatenation
      end
    end
  end

return record
  
end