def missing_letter(array)
  alphabet = (array[0]..array[-1]).to_a
  (alphabet - array)[0]
end
