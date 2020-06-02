def balanced?(string)
 left_right = 0
  string.chars.each do |char|
    left_right += if char = "("
    left_right -= if char = ")"
    return false if left_right < 0
  end
  return false if n != 0
  true
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false