def mix(s1, s2)
  result = []
  ("a".."z").each do |l|
    if s1.count(l) > 1 && s1.count(l) == s2.count(l)
      result << "=:#{l * s1.count(l)}/"
    elsif s1.count(l) > 1 && s1.count(l) > s2.count(l)
      result << "1:#{l * s1.count(l)}/"
    elsif s2.count(l) > 1 && s2.count(l) > s1.count(l)
      result << "2:#{l * s2.count(l)}/"
    end
  end
  result.sort! do |s1, s2| 
    if s2.length != s1.length
      s2[2..-1].length <=> s1[2..-1].length
    else s1 <=> s2
    end
  end
  result.join[0..-2]
end

p mix("Are they here", "yes, they are here") == "2:eeeee/2:yy/=:hh/=:rr"
p mix("looping is fun but dangerous", "less dangerous than coding") == "1:ooo/1:uuu/2:sss/=:nnn/1:ii/2:aa/2:dd/2:ee/=:gg"
p mix(" In many languages", " there's a pair of functions") == "1:aaa/1:nnn/1:gg/2:ee/2:ff/2:ii/2:oo/2:rr/2:ss/2:tt"
p mix("Lords of the Fallen", "gamekult") == "1:ee/1:ll/1:oo"
p mix("codewars", "codewars") == ""
p mix("A generation must confront the looming ", "codewarrs") == "1:nnnnn/1:ooooo/1:tttt/1:eee/1:gg/1:ii/1:mm/=:rr"
   