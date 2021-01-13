def swap_name(string)
  string.gsub(/\b(\w+)\b \b(\w+)\b/i, '\2, \1')
end

#

def swap_name(str)
  "#{str.split[1]}, #{str.split[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'