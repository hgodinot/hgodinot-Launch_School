def solution(string)
  string.gsub(/([a-z])([A-Z])/, '\1 \2')
end

p solution('camelCasing') == 'camel Casing'
p solution('camelCasingTest') == 'camel Casing Test'