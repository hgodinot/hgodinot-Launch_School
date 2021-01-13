#Three ways to do it. With gsub first:

ADJECTIVE = %w(quick lazy sleepy ugly)
NOUN = %w(fox dog head leg)
VERB = %w(jumps lifts bites licks)
ADVERB = %w(easily lazily noisily excitedly)

def madlib(str)
  str.gsub (/%{(.*?)}/) { Kernel.const_get($1.upcase).sample }
end

# Also with delete and const_get

ADJECTIVE = %w(quick lazy sleepy ugly)
NOUN = %w(fox dog head leg)
VERB= %w(jumps lifts bites licks)
ADVERB = %w(easily lazily noisily excitedly)

def madlib(str)
   str.delete("%{}").split.map  do |wrd|
     Kernel.const_get(wrd.upcase).sample
     rescue NameError; wrd
    end.join(" ")
end

# Same as above but with instance_variable_get

@adjective = %w(quick lazy sleepy ugly)
@noun = %w(fox dog head leg)
@verb = %w(jumps lifts bites licks)
@adverb = %w(easily lazily noisily excitedly)

def madlib(str)
   str.delete("{}%").split.map  do |wrd|
     instance_variable_get("@#{wrd}").sample
     rescue NameError; wrd
    end.join(" ")
end

