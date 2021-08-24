def sort_array(array)
  odds = []
  
  array.each do |n|
    odds << n if n.odd?
  end
  odds.sort!
  
  counter = -1
  result = array.map.with_index do |value, index|
    if value.odd?
      counter += 1
      odds[counter]
    else
      value
    end
  end
  
  result
end

p sort_array([5, 3, 2, 8, 1, 4]) == [1, 3, 2, 8, 5, 4]