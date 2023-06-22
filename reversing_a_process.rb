def decode(r)
  alphabet = ("a".."z").to_a
  number = ""
  letters = ""
  decoded_s = ""
  
  r.each_char do |char|
    if char !~ /\D/
      number += char
    else
      letters += char
    end
  end
  
  letters.each_char do |letter|
    coded_i = alphabet.index(letter)
    n = 0
    matches = []

    if (number.to_i % 26.0) == 0
      return "Impossible to decode"
    end
    
    decoded_i = (coded_i + n) / (number.to_i % 26.0)
    
    if decoded_i.round == decoded_i
      matches.push(decoded_i)
    end

    while decoded_i < 26
      n += 26
      decoded_i = (coded_i + n) / (number.to_i % 26.0)
      
      if decoded_i.round == decoded_i && decoded_i < 26
        matches.push(decoded_i)
      end
    end

    if matches.length > 1
      return "Impossible to decode"
    end

    if matches.length == 1
      s = alphabet[matches[0]]
      decoded_s += s
    end
  end

  return decoded_s
end

p decode("3107754aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")