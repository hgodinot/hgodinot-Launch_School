def josephus_survivor(n,k)
  idx = 0
  
  arr = (1..n).to_a
  until arr.length == 1 do
    idx += (k - 1)
    until idx < arr.length do
      idx -= arr.length
    end
    arr.delete_at(idx)
  end

  arr[0]
end

p josephus_survivor(7,3) == 4
p josephus_survivor(11,19) == 10
p josephus_survivor(1,300) == 1
p josephus_survivor(14,2) == 13
p josephus_survivor(100,1) == 100