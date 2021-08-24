def sudoku?(array)
  array.count(0) == 0 && array.uniq == array
end

def done_or_not(board)
  variations = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  slices = [[0, 3], [3, 3], [6, 3]]
  
  board.each { |line| return 'Try again!' if sudoku?(line) != true }
  board.transpose.each { |line| return 'Try again!' if sudoku?(line) != true }
  
  variations.each do |line|
    square = []
    
    slices.each do |idx|
      square = []
      square << board[line[0]].slice(idx[0], idx[1])
      square << board[line[1]].slice(idx[0], idx[1])
      square << board[line[2]].slice(idx[0], idx[1])
      return 'Try again!' if sudoku?(square.flatten) != true
    end
  end

  'Finished!'
end


p done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                         [6, 7, 2, 1, 9, 5, 3, 4, 8],
                         [1, 9, 8, 3, 4, 2, 5, 6, 7],
                         [8, 5, 9, 7, 6, 1, 4, 2, 3],
                         [4, 2, 6, 8, 5, 3, 7, 9, 1],
                         [7, 1, 3, 9, 2, 4, 8, 5, 6],
                         [9, 6, 1, 5, 3, 7, 2, 8, 4],
                         [2, 8, 7, 4, 1, 9, 6, 3, 5],
                         [3, 4, 5, 2, 8, 6, 1, 7, 9]]) == 'Finished!'

                                
p done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                         [6, 7, 2, 1, 9, 0, 3, 4, 9],
                         [1, 0, 0, 3, 4, 2, 5, 6, 0],
                         [8, 5, 9, 7, 6, 1, 0, 2, 0],
                         [4, 2, 6, 8, 5, 3, 7, 9, 1],
                         [7, 1, 3, 9, 2, 4, 8, 5, 6],
                         [9, 0, 1, 5, 3, 7, 2, 1, 4],
                         [2, 8, 7, 4, 1, 9, 6, 3, 5],
                         [3, 0, 0, 4, 8, 1, 1, 7, 9]]) == 'Try again!'
                         

p done_or_not(        [  [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
                          [ 2, 3, 4, 5, 6, 7, 8, 9, 1 ],
                          [ 3, 4, 5, 6, 7, 8, 9, 1, 2 ],
                          [ 4, 5, 6, 7, 8, 9, 1, 2, 3 ],
                          [ 5, 6, 7, 8, 9, 1, 2, 3, 4 ],
                          [ 6, 7, 8, 9, 1, 2, 3, 4, 5 ],
                          [ 7, 8, 9, 1, 2, 3, 4, 5, 6 ],
                          [ 8, 9, 1, 2, 3, 4, 5, 6, 7 ],
                          [ 9, 1, 2, 3, 4, 5, 6, 7, 8 ] ]) == 'Try again!'
