def spin_me(str)
  p string.object_id
  str.split.each do |word|
    word.reverse!
  end.join(" ")
  p string.object_id
end
