# Reverse a string, without using String#reverse

def string_reverser(str)
  new_str = ''
  str.chars.each.with_index {|x, idx| new_str << str[-idx - 1] }
  new_str
end

p string_reverser('hello') == 'olleh'
p string_reverser('Launch School') == 'loohcS hcnuaL'
