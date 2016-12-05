

def four_digit_number number
  unless number.to_i >= 1000 
    puts "Please enter a number greater or equal to 1000."
  else
  thousands_place =  number / 1000
  hundreds_place = number % 1000 / 100
  tens = number % 1000 % 100 / 10
  ones = number % 1000 % 100 % 10
  end
end
