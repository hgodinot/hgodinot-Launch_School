class PigLatin
  
  def self.translate(str)
    str.split.map do |wrd|
      
      if wrd[0, 2].match(/(xr)/) || (wrd[0].match(/[aeiouy]/) && !wrd[0, 2].match(/(ye)/))
        return wrd + "ay"
        
      else
        word_end = ""
        if wrd[0] == "y"
          word_end << "y"
          wrd = wrd[1..-1]
        end
        
        loop do
          if wrd[0,2] == "qu"
            word_end << "qu"
            wrd = wrd[2..-1]
          end
          break if wrd[0].match(/[aeiouy]/)
          word_end << wrd[0]
          wrd = wrd[1..-1]
        end
        
        wrd + word_end + "ay"
      end
      
    end.join(" ")
  end
end
