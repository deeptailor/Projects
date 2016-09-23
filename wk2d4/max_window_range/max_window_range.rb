def windowed_max_range1(array, w)

  min = array.first
  max = array.first
  max_range = 0
  current_max_range = nil
  right_window = 0
  left_window = 0

  while right_window < array.length
    right_window = left_window + (w-1)
    window_array = array[left_window..right_window]
    min = window_array.first
    max = window_array.first

    window_array.each do |e|
      min = e if e < min
      max = e if e > max
    end

    current_max_range = max - min

    max_range = current_max_range if current_max_range > max_range

    left_window += 1
  end

  max_range

end
#
# p windowed_max_range1([1, 0, 2, 5, 4, 8], 2)
# p windowed_max_range1([1, 0, 2, 5, 4, 8], 3)
# p windowed_max_range1([1, 0, 2, 5, 4, 8], 4)
# p windowed_max_range1([1, 3, 2, 5, 4, 8], 5)

def windowed_max_range2(array, w)
  max_range = 0
  i = 0
  while ((w - 1) + i) < array.length
    p window = array[i..(w - 1 + i)].sort
    current_max = window.last - window.first
    max_range = current_max if current_max > max_range
    i += 1
  end
  max_range
end


p windowed_max_range2([1, 0, 2, 5, 4, 8], 2)
p windowed_max_range2([1, 0, 2, 5, 4, 8], 3)
p windowed_max_range2([1, 0, 2, 5, 4, 8], 4)
p windowed_max_range2([1, 3, 2, 5, 4, 8], 5)
