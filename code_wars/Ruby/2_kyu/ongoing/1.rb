# https://www.codewars.com/kata/52a78825cdfc2cfc87000005/train/ruby
def calc expression
  # evaluate `expression` and return result
end



# tous nombres sont des float
# When no operator between digit and bracket, treat it as a multiply : # 2(1+1) == 2*2 = 4
# Peut y avoir juste nombre: -123

#Challenges: 
  # identifier nombres
  # Les signes moins devant les nombres.Comment savoir si nombre négatif ou opération ? 
    # dépend de ce qu'il y a avant. 
      # Si nombre alors opération. 
      # Si parenthèse ou autre signe, alors un nombre négatif
  # les multiplications
  # les parenthèses et parenthèses imbriquées. Probable récursion
    # Faut un contenu entier et à part pour chaque parenthèse. Equivalent d'un nombre.
    # puis traiter chaque parenthèse. Si nouvelle parenthèse on repart. Chaque fois qu'un "(" présent
    # faire un programme qui calcule sans les parenthèses. Faire passer le contenu de chaque parenthèse dedans.


class Calculator
  CONVERT = { "*" => :*, "/" => :/, "+" => :+, "- " => :- }
  
  def evaluate(string)
    num_idx = string.scan(/\-*\d/).map.with_index { |v, i| [v.to_f, i] }
    ope_idx = string.scan(/(\+|\- |\*|\/)/).flatten.map.with_index { |op, idx| [op, idx] }
    ope_ord = ope_idx.partition { |v| ["/", "*"].include?(v[0]) }
    used_index_num = []
    new_num = []
    ope_ord[0].each do |ope|
      result = num_idx[ope[1]]{}[0].send(CONVERT[ope[0]], num_idx[ope[1] + 1][0])
      new_num << [result, ope[1]]
      used_index_num << ope[1] << ope[1] + 1
    end
    
    remaining_num = num_idx.reject { |v| used_index_num.include?(v[1]) }
    num = (remaining_num + new_num).sort_by { |v| v[1] }.map{ |v| v[0] }
    ope = ope_ord[1].map{ |v| CONVERT[v[0]] }
    

    num.reduce {  |acc, num| acc.send(ope.shift, num) }
  end
end
