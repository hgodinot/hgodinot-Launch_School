#Permutations

# Using the permutation method. 
def permutations(string)
  string.chars.permutation.to_a.map(&:join).uniq
end
 
p permutations('a') == ['a']
p permutations('ab') == ['ab', 'ba']
p permutations('aabb') == ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']


# Not using the permutation method. 
def permutation(string)
  return [string] if string.size < 2
  char = string[0]
  perms = permutation(string[1..-1])
  result = []
  perms.each do |perm|
    result << char + perm
    (1..perm.length-1).each do |i|
      result << perm[0..i-1] + char + perm[i..-1]
    end
    result << perm + char
  end
  result.uniq
end
 
p permutation('a') == ['a']
p permutation('ab') == ['ab', 'ba']
p permutation('aabb') == ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']