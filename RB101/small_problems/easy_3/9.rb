def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  p string == string.reverse
end 
