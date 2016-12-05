def factors(number)
  dividend = number
  divisors = []
  while dividend >0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end 
  divisors
end

p factors(100)
p factors(0)
p factors(-1)
