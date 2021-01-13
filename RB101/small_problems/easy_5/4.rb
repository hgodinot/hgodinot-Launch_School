def swap(str)
  str.split.map{ |wrd| wrd.size > 1 ? wrd[-1] + wrd[1..-2] + wrd[0] : wrd }.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'