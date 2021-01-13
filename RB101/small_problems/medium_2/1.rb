def longest_sentence(str)
  sentence = str.split(/[\.\!\?]/).sort_by{ |sen| sen.split.size }.last
  print "The longest sentence is #{sentence.split.size} words long: #{sentence}"
end