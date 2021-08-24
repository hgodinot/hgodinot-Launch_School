#search_for_letters
def change(string)
  result = ""
  ("a".."z").to_a.each do |letter|
    if string.downcase.include?(letter)
      result << "1"
    else
      result << "0"
    end
  end
  result
end

p change("a **&  bZ") == "11000000000000000000000001"