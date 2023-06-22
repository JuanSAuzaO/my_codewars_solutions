def rotate(str)
  array = []
  new = str
  str.each_char.with_index do |char, i|
    new = new.slice(1, new.length - 1)
    new += char
    array.push(new)
  end
  
  return array
end