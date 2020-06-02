def stringy(integer, string = "")
  integer.times do |index|
    index.even? ? string << '1' : string << '0'
  end

  string 
end
