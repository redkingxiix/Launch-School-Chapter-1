p "How old are you"
age = gets.chomp.to_i
unless age.to_i > 0
  p "Please use positive numbers"
else
  age += 20
  p "You will be #{age} in 20 years."
end


