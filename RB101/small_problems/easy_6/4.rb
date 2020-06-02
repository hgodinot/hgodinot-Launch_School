def reverse!(array)
    ((array.size)/2).times do |idx|
      array[idx], array[(-idx - 1)] = array[(-idx - 1)], array[idx]
    end
    
  array
end

list = [1,2,3,4]
p result = reverse!(list)
p list 
p list.object_id
p result.object_id

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

p list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

p list = []
p reverse!(list) == []
p list == []