VALUES = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, 
eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)

def alphabetic_number_sort(array)
  hash = {}
  20.times do |index|
    hash[index] = VALUES[index]
  end
  
  array.sort_by! do |value|
    hash[value]
  end
  array
end

