def multiply number_1, number_2
  if number_1 == 0 && number_2 == 0
    p "Please use positive numbers"
  else
    p number_1 * number_2
  end
end

p "Give me a number"
number_one = gets.chomp.to_i
p "and another one"
number_two = gets.chomp.to_i

multiply(number_one, number_two)
