def xor?(boolean_1, boolean_2)
  return true if boolean_1 && !boolean_2
  return true if boolean_2 && !boolean_1
end
