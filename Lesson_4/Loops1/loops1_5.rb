say_hello = true
iterations = 1

while say_hello
  puts 'Hello!'
  if iterations >= 5
    say_hello = false
  end
  iterations += 1
end
