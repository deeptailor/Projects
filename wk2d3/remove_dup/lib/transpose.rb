def my_transpose(array)
  result_array = []

  i = 0

  while i < array.length

    j = 0
    a = []
    while j < array[i].length
      a << array[j][i]
      j += 1
    end
    i += 1
    result_array << a
  end
  result_array
end
