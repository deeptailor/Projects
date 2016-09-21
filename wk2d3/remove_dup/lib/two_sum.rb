def two_sum(array)
  results = []
  i = 0

  while i < array.length
    j = i + 1

    while j < array.length
      results << [i, j] if array[i] + array[j] == 0
      j += 1
    end

    i += 1
  end
  results
end
