def twos_difference(lst)
  result = []
  lst.each_with_index do |val1, idx|
    lst.slice(idx + 1, lst.length).each do |val2|
      result << [val1, val2] if val2 - val1 == 2
      result << [val2, val1] if val1 - val2 == 2
    end
  end
  result.sort  
end

p twos_difference([1, 2, 3, 4]) == [[1, 3], [2, 4]]
p twos_difference([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p twos_difference([1, 23, 3, 4, 7]) == [[1, 3]]
p twos_difference([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]