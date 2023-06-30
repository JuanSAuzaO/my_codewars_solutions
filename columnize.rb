# Link to challenge instructions: https://www.codewars.com/kata/6087bb6050a6230049a068f1

def columnize(items, columns_count)
  # 1.1 Here we determine how many rows we are going to need to place our items.
  rows = items.length / columns_count.to_f
  # 1.2 In case rows number is not an integer we increase it by one.
  rows += 1 if rows != rows.round

  new_items = "" # 1.3 Here we will store our answer.
  record = 0 # 1.4 Record will address index from items array.
  column = 1 # 1.5 This will indicate the selected column.
  max_length = {} # 1.6 Here we will keep the max length string of each column.

  items.each_with_index do |item| 2. # 2 We start an iteration over items array.
    # If selected column is greater than total of columns, we reset and go to next row.
    if column > columns_count
      column = 1
    end
    # We check if there is a max length entry for the selected column, if not we set 0.
    max_length["column#{column}"] ||= 0
    # If our current item's length is greater than the max_length registered:
    if item.length > max_length["column#{column}"]
    # Then we give max_length of selected column the current item length value.
      max_length["column#{column}"] = item.length
    end
    # We prepare to select next column in next iteration by increasing its value by 1.
    column += 1
  end

  if columns_count > 1 # 3.a In case we have more than one column.
    for i in 1..rows # 4.a We will start an iteration over rows:
      for j in 1..columns_count # 5.a And an iteration over columns per each row:
        if items[record] # We check if there exist an item at addressed index.
          # If so, we add the item justified to left, and occupying the space set at max_length.
          new_items += items[record].ljust(max_length["column#{j}"])
          # If column number is under column count and our item is not the last we add the separation.
          new_items += " | " if j < columns_count && record != items.length - 1
          # Finally we increase the record number to repeat the operation with next item.
          record += 1
        end
      end
      if items[record] # If there is an item coming in next row.
        new_items += "\n" # We make a line break.
      end
    end
  else # 3.b In case we just have one column.
    j_items = items.map do |item| # 4.b We start a map iteration to form a new array:
      # Containing each element justified to left occupying the max length defined space.
      item.ljust(max_length["column1"])
    end
    # 5.b Finally we just join the j_items array into a string.
    new_items = j_items.join("\n")
  end
  
  return new_items # 6 We return the final answer.
end