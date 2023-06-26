#Link to the challenge to check instructions: https://www.codewars.com/kata/5e0b72d2d772160011133654

def solve arr 
  min = arr.min # 1.1 First we store the pile with the least amount of chips from the array.
  max = arr.max # 1.2 Then we store the pile with the max amount of chips.
  # 1.3 Finally we store the pile with the medium amount of chips.
  med = (arr.select.with_index { |num, i| i != arr.index(min) && i != arr.rindex(max) })[0]
  # We achieve that by selecting the first array element that doesn't equal neither the min variable index, nor the max variable index,
  # in such a case the tree piles have equal values, we use rindex for the max value, to be sure it is not index 0, but 2.
  total_chips = min + med + max # 2.1 We calculate the total amount of chips.
  # a example: [8, 4, 12] => (8 + 4 + 12) => 24.
  # b example: [2, 4, 7] => (2 + 4 + 7) => 13.

  max_days = total_chips / 2 # 2.2 We get the max amount of days possible with all our chips by dividing into 2.
  # a example: 24 / 2 => 12 days. 
  # b example: 13 / 2 => 6 days (6.5 gets rounded because we are using integers).

  if (min + med) >= max # 3 We check if the max amount is bigger than both the min and med combined.
    # Because we can first combine max with min, then med with max.
    days = (min + med) / 2.0 + max / 2.0 # 4.a In such case, we divide the combination into 2, and add the max amount divided into 2.
    # example: [8, 4, 12] => (8 + 4) / 2 + 12 / 2 => 12 days. It matches the max amount of days for "a" example.
  else
    days = min + med # 4.b In the other case, we just sum the min and med chips. Because we are limited to their amount.
    # example [2, 4, 7] => 2 + 4 => 6 days. It maches the max amount of days for "b" example.
  end

  return days.to_i # 5 we return the final result as integer.
end

p solve([1,1,1])