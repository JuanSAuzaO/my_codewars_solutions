def solution(roman)
  database = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }
  value = 0
  roman.each_char.with_index do |letter, i|
    if database[letter.to_sym]
      if letter == "I" && roman[i+1] == "V" && i != roman[-1]
        value += 4
      elsif letter == "V" && roman[i-1] == "I" && i != 0
        value += 0
      elsif letter == "I" && roman[i+1] == "X" && i != roman[-1]
        value += 9
      elsif letter == "X" && roman[i-1] == "I" && i != 0
        value += 0
      else
        value += database[letter.to_sym]
      end
    end
  end
  return value
end