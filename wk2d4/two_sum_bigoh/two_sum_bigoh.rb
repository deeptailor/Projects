

def bad_two_sum(arr, target_sum)

  perms = arr.permutation(2).to_a
  perms = perms.map do |perm|
    perm.inject(:+)
  end
  value_arr = []
  perms.each do |num|
    if num == target_sum
      value_arr << num
    end
  end
  value_arr.length > 0

end


def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  idx = 0
  arr.each_with_index do |n, i|
    if n > target_sum
      idx = i
      break
    end
  end
  p arr = arr.take(idx)
  arr.each_with_index do |n, i|
    arr.each_with_index do |x, j|
      next if i == j
      unless j < i
        return true if n + x == target_sum
      end
    end
  end
  return false

end

big_arr = []

100000.times do
  big_arr << rand(1000)
end

# p big_arr

# p okay_two_sum?(big_arr, rand(50))


def hash_pair_sum?(array, target)
  hash = Hash.new(0)

  array.each do |e|
    if hash[e].nil?
      hash[e] = 1
    else
      hash[e] += 1
    end
    remainder = target - e
    return true if hash[remainder] >= 1
  end
  return false
end

arr = [0, 1, 5, 7]

p hash_pair_sum?(arr, 6)
