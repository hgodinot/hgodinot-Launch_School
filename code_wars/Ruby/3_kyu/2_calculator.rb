# https://www.codewars.com/kata/5235c913397cbf2508000048/train/ruby
class Calculator
  CONVERT = { "*" => :*, "/" => :/, "+" => :+, "- " => :- }
  
  def evaluate(string)
    num_list = create_num_list(string)
    ope_list = create_ope_list(string)
    return num_list.first.first unless ope_list
    
    ope_list.first.each do |ope|
      result = num_list[ope[1]][0].send(CONVERT[ope[0]], num_list[ope[1] + 1][0])
      num_list.reject! { |v| [ope[1], ope[1] + 1].include?(v[1]) }
      num_list << [nil, ope[1]] << [result, ope[1] + 1]
      num_list.sort! { |a, b| a[1] <=> b[1] }
    end
    
    num = num_list.reject { |v| !v[0] }.map{ |v| v[0] }
    return num[0] if num.size == 1
    ope = ope_list[1].map{ |v| CONVERT[v[0]] }
    num.reduce {  |acc, num| acc.send(ope.shift, num) }
  end
  
  def create_num_list(str)
    str.scan(/\-*\d+/).map.with_index { |v, i| [v.to_f, i] }
  end
  
  def create_ope_list(str)
    temp = str.scan(/(\+|\- |\*|\/)/).flatten.map.with_index { |op, idx| [op, idx] }
    temp.empty? ? nil : temp.partition { |v| ["/", "*"].include?(v[0]) }
  end
end

# best practice:
=begin
class Calculator
  def evaluate(string)
    [' + ', ' - ', ' * ', ' / '].each do |op|
      if string.include?(op)
        return string.split(op).map { |s| evaluate(s) }.inject(op.strip)
      end
    end
    string.to_f
  end
end
=end


