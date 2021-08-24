#Text door

def neighbors_of(phone_number)
  result = []
  neighbors = {"1" => ["2", "4"], "2" => ["1", "3", "5"], "3" => ["2", "6"], 
               "4" => ["1", "5", "7"], "5" => ["2", "4", "6", "8"], 
               "6" => ["3", "5", "9"], "7" => ["4", "8"], "8" => ["0", "5", "7", "9"],
               "9" => ["6", "8"], "0" => ["8"] }
  arr = phone_number.chars
  arr.each_with_index do |val, idx|
    neighbors[val].each do |neighbor|
      clone = arr.dup
      clone[idx] = neighbor
      result << clone.join
    end
  end
  result.sort
end


b = ["1892", "4092", "4592", "4792", "4862", "4882", "4891", "4893", "4895", "4992", "5892", "7892"]
p neighbors_of("4892") == b 

p neighbors_of("1") == ["2", "4"]
a = ["5675309", "7675309", "9675309", "0675309", "8375309", "8575309", "8975309",
   "8645309", "8685309", "8672309", "8674309", "8676309", "8678309", "8675209",
   "8675609", "8675389", "8675306", "8675308"].sort
p neighbors_of("8675309") == a 