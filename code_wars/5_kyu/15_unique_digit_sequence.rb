# Unique digit sequence

def find_num(n)
  arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  return arr[n] if n < 10
  loop do
    break if arr.length == (n + 1)
    val = 10
    loop do 
      val += 1
      if (arr.include?(val) == false && (arr[-1].digits & val.digits) == [])
        arr << val
        break
      end
    end
  end
  arr[-1]
end

p find_num(1) == 1
p find_num(5) == 5
p find_num(11) == 22
p find_num(100) == 103
p find_num(500) == 476
 