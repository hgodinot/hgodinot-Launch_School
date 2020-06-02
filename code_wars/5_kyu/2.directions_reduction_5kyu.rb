def dirReduc(arr)
  result = []
  opposite = { "NORTH" => "SOUTH",
                 "SOUTH" => "NORTH",
                 "WEST" => "EAST",
                 "EAST" => "WEST" }
  
  arr.each do |dir|
    opposite[dir] == result[-1] ? result.pop : result.push(dir)
  end
  result
end

p dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]) == ["WEST"]

p dirReduc(["NORTH", "WEST", "SOUTH", "EAST"]) == ["NORTH", "WEST", "SOUTH", "EAST"]