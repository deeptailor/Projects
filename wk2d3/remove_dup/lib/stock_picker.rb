def stock_picker(array)
  result = []
  biggest_difference = 0
  i = 0

  while i < array.length
    j = i + 1

    while j < array.length
        difference = array[j] - array[i]
        if difference > biggest_difference
          biggest_difference = difference
          result = [i,j]
        end
        j += 1
    end
    i += 1
  end
  return result
end
