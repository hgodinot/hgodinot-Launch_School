flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p flintstones.zip([0, 1, 2, 3, 4, 5]).to_h

flintstones2 = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
new_hash = {}
flintstones2.each_with_index {|value, index| new_hash[value] = index}
p flintstones2 = new_hash
  
  