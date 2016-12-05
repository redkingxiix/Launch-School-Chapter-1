def greeting name
  p "Hello, #{name}. How\'re you today?"
end

p "What\'s your name?"
name = gets.chomp
greeting(name)


