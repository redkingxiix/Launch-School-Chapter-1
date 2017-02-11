def greeting
  puts 'Hello!'
end

number_of_greetings = 2

loop do
  greeting
  number_of_greetings -= 1
  break if number_of_greetings == 0
end
