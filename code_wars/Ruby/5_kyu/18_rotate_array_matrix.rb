def rotate(matrix, direction)
  return matrix.transpose.map(&:reverse) if direction == 'clockwise' 
  matrix.transpose.reverse
end

matrix =[[1,2,3],
         [4,5,6],
         [7,8,9]]
         
p rotate(matrix, 'counter-clockwise') == [[3,6,9],[2,5,8],[1,4,7]]
p rotate(matrix, 'clockwise') == [[7,4,1],[8,5,2],[9,6,3]]

#rotate an array matrix
=begin

Input = array + string word
Output: Array rotated cloxckwise or the other way around
Rules: One way or the other
Data: Array

Algorithm


=end
