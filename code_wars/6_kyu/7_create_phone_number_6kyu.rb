def createPhoneNumber(array)
  "(#{array.slice(0,3).join}) #{array.slice(3,3).join}-#{array.slice(6,4).join}"
end

p createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) == "(123) 456-7890"