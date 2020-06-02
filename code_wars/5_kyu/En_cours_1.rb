def choose_best_sum(max, num, array)
  l = array.length
  subarrays = []
  return nil if l < num || array.sort.slice(0, num).sum > max
  best_result = 0
  temp = []

  0.upto(l-num) do |idx_0|
    temp = []
    temp << array[idx_0]
    (idx_0 + 1).upto(l-num + 1) do |idx_1|
      temp = temp.slice(0,1) if temp.length == 2
      temp << array[idx_1]
      (idx_1 + 1).upto(l-num + 2) do |idx_2|
        temp << array[idx_2]
        subarrays << temp
        temp = temp.slice(0,2)
      end
    end
  end

  subarrays.each do |subarray|
    best_result = subarray.sum if subarray.sum <= max && subarray.sum > best_result
  end

  best_result
end


ts = [50, 55, 56, 57, 58]
p choose_best_sum(163, 3, ts) #== 163
ts = [50]
p choose_best_sum(163, 3, ts) == nil
ts = [91, 74, 73, 85, 73, 81, 87]
p choose_best_sum(230, 3, ts) #== 228
