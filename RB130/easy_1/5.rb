ENCRYPTION = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu']

def decypher(word)
  result = []
  word.each_char do |char|
    case char.ord
    when 65..77, 97..109 then result << (char.ord + 13).chr
    when 78..90, 110..122 then result << (char.ord - 13).chr
    else result << char
    end
  end
  result.join
end

ENCRYPTION.each { |cypher| puts decypher(cypher) }
