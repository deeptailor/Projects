def remove_dup(arr)
  arr1 =[]

  arr.each do |e|
    if arr1.include?(e)
      next
    else
      arr1 << e
    end
  end
  arr1
end
