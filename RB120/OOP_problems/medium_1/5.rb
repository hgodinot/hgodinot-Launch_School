class Minilang
  COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  
  def initialize(str)
    @register = 0
    @stack = []
    @commands = str.split
    if @commands.any? { |token| !valid?(token) }
      raise ArgumentError.new, "Invalid token: #{@commands.find { |tok| !valid?(tok)}}"
    end
    raise ArgumentError.new, "(nothing printed; no PRINT commands)" if @commands.none?("PRINT")
  end
  
  def eval
    @commands.each do |token| 
      if string_int?(token)
        @register = token.to_i
      else
        self.send(token.downcase)
      end
    end
  end
  
  def valid?(token)
    COMMANDS.include?(token) || string_int?(token)
  end
  
  def string_int?(token)
    token.to_i.to_s == token
  end
  
  def print
    puts @register
  end
  
  def push
    @stack.unshift(@register)
  end
  
  def pop
    @register = shift
  end
  
  def add
    @register += shift
  end
  
  def sub
    @register -= shift
  end
  
  def mult
    @register *= shift
  end
  
  def div
    @register /= shift
  end
  
  def mod
    @register %= shift
  end
  
  def shift
    raise StandardError, "Empty stack!" if @stack.empty?
    @stack.shift
  end
end



Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

#Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

#Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

#Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)