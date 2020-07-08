def reorder(str)
  raise ArgumentError, "Only accepts letters, spaces and dot" if str.match(/[^a-z\. ]/i)
  raise ArgumentError, "No empty string." if str.strip.empty?
  str.delete!(".")
  array = str.split
  array = array.map.with_index { |word, idx| idx.even? ? word : word.reverse }
  array.join(" ") << "."
end
  
p reorder("whats the matter with kansas.")
p reorder("whats     the   matter    with  kansas    .")
#p reorder("whats     the   matter    with  kansas  ,  .")

#only letters, space, and one single point (rajouter à la fin)

# "whats the matter with kansas." =>"whats eht matter htiw kansas."
# "whats     the   matter    with  kansas    ." =>"whats eht matter htiw kansas."

#Invalid input ? What do do with them ?
# edge cases: "" "." " hello . "
