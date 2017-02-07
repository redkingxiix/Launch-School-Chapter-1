numbers = []
rando = Random.new

while numbers.length !=5
  number = rando.rand(1..99)
  unless numbers.include?(number)
    puts number
    numbers.push(number)
  end
end
#REFACTORED
#numbers = []
#
#while numbers.size < 5
#  numbers << rand(100)
#end
#
#puts numbers
