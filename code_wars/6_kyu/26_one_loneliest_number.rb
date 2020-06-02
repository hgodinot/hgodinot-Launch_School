=begin

Input: An Integer

Output : Boolean, true of false

Rules: For each digit of a number, determine sum of loneliness. 
Check if there is a digit 1 for which loneliness is minimal. 
If no 1 in the number, false. 
If there is a 0 in the number, the loneliness of the 1 will need to be 0 also for the method to return true

Data: Arrays, simpler to add different digits

Algorithm:

Convert argument number to array
If array does not include 1 as an element, return false. 
Iterate over this array, for each element, determine sum of loneliness. Store the global minimum number and 
for the digit 1, the minimum number for 1
At the end of the iteration, if the global minimuml number is equal to the minimum number for 1, true. Else, false. 

Define method
  Convert argument number to an array
  Return false if array does not include 1 as an element
  Initialize global_min = nil & one_min = nil
  Call each_with_index method on this array. For each element, determine sum of their loneliness using the slice method. 
  If global_min = nil 
    then global_min = this sum.
  else 
    global_min = this sim is this sum < global min
  end
  if this element is a 1
    if One_min == nil
      this sum == one min
    if One_min != nil
      one_min = this sum if one_min > this sum
    end
    at the end of iteration, return true if one_min == global_min
    false (otherwise)
end

=end 

def loneliest?(number)
  number = number.to_s.chars.map(&:to_i)
  return false if number.count(1) == 0
  global_min = one_min = nil
  sol = 0
  
  number.each_with_index do |val, idx|
    if (idx - val) < 0
      sol = number[0, idx].sum + number[idx + 1, val].sum
    else
      sol = number[idx - val, val].sum + number[idx + 1, val].sum
    end
    global_min = sol if global_min == nil || global_min != nil && global_min > sol
    if val == 1
      one_min = sol if one_min == nil || one_min != nil && one_min > sol
    end
  end
  one_min == global_min
end


p loneliest?(34315) == true
p loneliest?(123456) == true
p loneliest?(65432165432) == false
p loneliest?(0) == false
p loneliest?(1) == true
p loneliest?(11111) == true