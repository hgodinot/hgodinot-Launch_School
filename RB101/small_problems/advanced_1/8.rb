def merge(arr1, arr2)
  return [arr1, arr2].max_by { |arr| arr.size } if [arr1, arr2].any?([])
  
  idx1 = 0
  idx2 = 0
  result = []
  
  loop do
    if arr1[idx1] < arr2[idx2] 
      result << arr1[idx1]
      idx1 += 1
    else
      result << arr2[idx2]
      idx2 += 1
    end
    return (result << arr2[idx2..-1]).flatten if idx1 == arr1.size
    return (result << arr1[idx1..-1]).flatten if idx2 == arr2.size
  end
end


def merge_sort(array)
  validate_argument(array)
  return array if array.size == 1
  
  sub_array1 = array[0, array.size / 2]
  sub_array2 = array[array.size / 2 .. -1 ]
  
  sub_array1 = merge_sort(sub_array1)
  sub_array2 = merge_sort(sub_array2)
  
  merge(sub_array1, sub_array2)
end

def validate_argument(arg)
  raise ArgumentError, "Argument must be an array of Integers or of strings" if 
  arg.class != Array || 
  arg.map { |el| el.class }.uniq.size != 1 ||
  arg.any? { |el| ![Integer, String].include?(el.class) }
end
