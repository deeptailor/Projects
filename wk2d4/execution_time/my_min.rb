def my_min(arr)
  real_min = arr.first
  arr.each do |n|
    arr.each do |e|
      real_min = e if e < n
    end
  end
  real_min
end



arr = (0..20).to_a.reverse

# p my_min(arr)


def sub_sum(arr)

  max = arr.first
  result = 0
  count1 = 0
  prev_num = 0

  while count1 < arr.length
    current_num = arr[count1]
    result += current_num
    max = result if result > max
    if (current_num + prev_num) > max
      max = current_num + prev_num
      result = max
    end
    prev_num = current_num
    count1 += 1
  end
  max
end

list = [-100, 5, 3, -7, 8]

p sub_sum(list)
