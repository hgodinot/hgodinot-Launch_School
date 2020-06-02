# Tic-Tac-Toe Checker

require "pry"
def winner?(board, num)
  return true if board[0] == [num] * 3 || board[1] == [num] * 3 || board[2] == [num] * 3
  return true if board.transpose[0] == [num] * 3 || board.transpose[1] == [num] * 3 || board.transpose[2] == [num] * 3
  return true if [board[0][0], board [1][1], board[2][2]] == [num] * 3
  return true if [board[0][2], board [1][1], board[2][0]] == [num] * 3
  false
end


def is_solved(board)
  return 1 if winner?(board, 1)
  return 2 if winner?(board, 2)
  return 0 if board.flatten.count(0) == 0
  - 1
end

p is_solved([[0,0,1],[0,1,2],[2,1,0]]) == -1
p is_solved([[0,0,1],[2,2,2],[2,1,0]]) == 2
p is_solved([[1,0,1],[0,1,2],[2,1,1]]) == 1

=begin
0 if a spot is empty, 
1 if it is an "X", 
2 if it is an "O"

-1 if the board is not yet finished (there are empty spots),
1 if "X" won,
2 if "O" won,
0 if it's a cat's game (i.e. a draw).

Input: Array of 3 arrays, 3 elements each (integers ranging from 0 to 2
Output: Integer

Rule: Check completion of the game. 

Data: Array

Algorithm:

Check if X wins and return 1 if so
Check if O wins and return 2 if so
Check if draw (board full, no 0) and return 0 if so
- 1 (if none of the other conditions)

To check if a player won: New method definition, accepting an array and an integer (1 or 2) as arguments
Check if any line (subarrays) of the array has full 1 or 2, depending on argument. 
Same for the array transpose (columns)
Check the two diagonals
Every time return true if 3 elements found
by default, return false
=end