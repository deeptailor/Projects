# def anagrams(string1, string2)
#   string1_perms = string1.split('').permutation(string1.length).to_a.map(&:join)
#   string1_perms.include?(string2)
# end
#
# p anagrams('elvis', 'lives')

# def second_anagram?(string1, string2)
#   string1 = string1.split("")
#   string2 = string2.split("")
#   p string1
#   p string2
#   count = 0
#   while count <= string1.length
#     count2 = 0
#     while count2 <= string2.length
#       if string1[count] == string2[count2]
#         string1.delete(string1[count])
#         string2.delete(string2[count2])
#         p string1
#         p string2
#       else
#         count2 += 1
#       end
#     end
#     count += 1 if count2 == string2.length
#   end
#   return true if string1.empty? && string2.empty?
# end



#   string1.split("").each do |char1|
#     string2.split("").each do |char2|
#       if char1 == char2
#
# end

def second_anagram?(str1, str2)
  str_arr1 = str1.split('').sort
  str_arr2 = str2.split('').sort

  count1 = 0

  while count1 < str1.length
    count2 = 0
    while count2 < str2.length
      letter1 = str1[count1]
      letter2 = str2[count2]
      if letter1 == letter2
        str_arr1.delete(letter1)
        str_arr2.delete(letter2)
      end
      count2 += 1
    end
    count1 += 1
  end
  str_arr1.empty? && str_arr2.empty?
end


def fourth_anagram?(str1,str2)
  hash1 = {}
  hash2 = {}

  str1.each_char do |e|
    if hash1[e] == nil
      hash1[e] = 1
    else
      hash1[e] += 1
    end
  end

  str2.each_char do |e|
    if hash2[e] == nil
      hash2[e] = 1
    else
      hash2[e] += 1
    end
  end
  p hash1
  p hash2
  hash1 == hash2

end




p fourth_anagram?('abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz', 'taoxveukhmypribsqwncjlgzdf')
