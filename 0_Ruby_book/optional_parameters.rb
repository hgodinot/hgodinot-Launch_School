 def greeting(name, options = {})
    if options.empty?
      puts "Hello, my name is #{name}."
    else 
      puts "Hello, my name is #{name}, I'm #{options[:age]} " +
      " years old, and I live in #{options[:city]}. "
    end 
  end 


greeting("Bob")
greeting("Bob", {age: 62, city: "NYC"})

