def minilang(string)
  stack = [0]
  register = 0
  
  string.split.each do |word|
    if word.to_i.to_s == word
      register = word.to_i
    elsif word == "PUSH"
      stack << register
    elsif word == "ADD"
      register += stack.pop
    elsif word == "SUB"
      register -= stack.pop
    elsif word == "MULT"
      register *= stack.pop
    elsif word == "DIV"
      register /= stack.pop
    elsif word == "MOD"
      register = register%(stack.pop)
    elsif word == "POP"
      register = stack.pop
    elsif word == "PRINT"
      puts(register)
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)