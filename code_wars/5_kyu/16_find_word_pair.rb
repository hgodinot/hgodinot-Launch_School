# Find the Word Pair!

def compound_match(fragments, target)
  word1 = word2 = ""
  idx1 = idx2 = nil
  fragments.uniq.each do |word|
    if !!target.match(word)
      word1 = word
      idx1 = fragments.index(word)
      word2 = target.sub(word1, "")
      idx2 = fragments.index(word2)
      if idx2 != nil
        if word1 + word2 == target
          return [word1, word2, [idx1, idx2,]]
        else 
          return [word1, word2, [idx2, idx1,]]
        end
      end
    end
  end
  nil
end
    
 arr1 = ['super','bow','bowl','tar','get','book','let']
 arr2 = ['bow','crystal','organic','ally','rain','line']
 arr3 = ['top','main','tree','ally','fin','line']
 arr4 = ['bel', 'bed', 'low', 'grab', 'be', 'knight']

p compound_match(arr1, 'superbowl') == ['super','bowl', [0,2]]
p compound_match(arr2, 'crystalline') == ['crystal','line', [1,5]]
p compound_match(arr2, 'rainbow') == ['bow','rain', [4,0]]
p compound_match(arr2, 'organically') == ['organic','ally', [2,3]]
p compound_match(arr3, 'mainline') == ['main','line', [1,5]]
p compound_match(arr3, 'treetop') == ['top','tree', [2,0]]
p compound_match(arr3, 'finally') == ['ally','fin', [4,3]]
p compound_match(arr3, 'treefinally') == nil
p compound_match(arr4, 'below') == ['low','be', [4,2]]
p compound_match(arr4, 'bellow') == ['bel','low',[0,2]]
p compound_match(arr4, 'beknight') == ['be','knight',[4,5]]

=begin

Input: Array, and string

Output: Either one array with 2 strings words and as last element an array with two indexes, or nil. 

Rule: Find words that combine will compose the target string argument. Return these words + their index. 

Data: Array

Algo:
Initialize two empty strings, word1 & word2
Initialize two variables idx1 & idx2, they are equal to nil
Iterate over array with index, and for every word look for a match with target.
  When there is a match, store it in word1 & store index in idx1. Break. 
  Break
  Iterate again, looking if word1 + current word (or conversly) is equal to target. If it is
  store value of second word and it's index. 
  return [word 1, word2, [idx1, idx2]]
  if nothing is found, nil

=end
