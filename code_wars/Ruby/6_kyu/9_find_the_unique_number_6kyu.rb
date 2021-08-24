def find_uniq(arr)
  arr.sort!
  return arr[0] if arr[0] != arr[1]
  1.upto(arr.length - 2) do |idx|
    return arr[idx] if (arr[idx] != arr[idx -1] && arr[idx] != arr[idx + 1])
  end
  arr[-1]
end


p find_uniq([1,1,1,1,0]) ==  0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
