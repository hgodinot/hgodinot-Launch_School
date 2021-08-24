def check_number(n, phrase)
  return false if n < 100
  n = n.to_s.chars.map(&:to_i)
  
  return true if n == n.reverse
  return true if n[0] != 0 && n.slice(1, (n.length) - 1).sum == 0
  return true if n.uniq.length == 1
  
  if n.count(0) == 0
    return true if (n == n.sort && n[-1] - n[0] == n.length - 1)
  elsif n.count(0) == 1 && n[-1] == 0 && n[-2] == 9
    return true if n.slice(0, (n.length - 1)) == n.slice(0, (n.length - 1)).sort &&
    n[-2] - n[0] == n.length - 2
  end
  
  if n.count(0) == 0
    return true if (n == n.sort.reverse && n[0] - n[-1] == n.length - 1)
  elsif n.count(0) == 1 && n[-1] == 0 && n[-2] == 1
    return true if n.slice(0, (n.length - 1)) == n.slice(0, (n.length - 1)).sort.reverse &&
    n[0] - n[-2] == n.length - 2
  end
  
  if phrase.length > 0
    phrase.each do |word|
      return true if n.join.to_i == word
    end
  end

false
end

def is_interesting(number, awesome_phrases)
  return 2 if check_number(number, awesome_phrases)
  return 1 if check_number(number + 1, awesome_phrases)
  return 1 if check_number(number + 2, awesome_phrases)
  0
end

p is_interesting(3, [1337, 256]) ==     0
p is_interesting(1336, [1337, 256]) ==  1
p is_interesting(1337, [1337, 256]) ==  2
p is_interesting(11208, [1337, 256]) == 0
p is_interesting(11209, [1337, 256]) == 1
p is_interesting(11211, [1337, 256]) == 2
