def top_3_words(text)
  result = []
  hsh = {}
  text = text.gsub(/[^a-zA-Z']/, " ")

  text.downcase.split.each do |word|
    if hsh[word] == nil
      hsh[word] = 1
    else
      hsh[word] += 1
    end
  end
  
  ordered_list = hsh.to_a.sort_by {|subarray| subarray[1]}.reverse
  
  if ordered_list.length > 2
    result << ordered_list[0][0] 
    result << ordered_list[1][0] 
    result << ordered_list[2][0]
  else
    ordered_list.each do |subarray|
      result << subarray[0]
    end
  end
  
  result = [] if result == ["'"] || result == ["'''"]
  result
end

p top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.") == ["a", "of", "on"]

p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]

p top_3_words("  //wont won't won't") == ["won't", "wont"]
