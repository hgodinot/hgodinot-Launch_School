def transpose(m)
  [0, 1, 2].each_with_object([]) { |i, a| a << m.map.with_index { |_, idx| m[idx][i] } }
end

# 

def transpose(matr)
  [0, 1, 2].each_with_object([]) do |idx1, arr1|
    arr1 << [0, 1, 2].each_with_object([]) do |idx2, arr2|
      arr2 << matr[idx2][idx1]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
