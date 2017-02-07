numbers = [7, 9, 13, 25, 18]
counter = numbers.length - 1

until counter < 0
  p numbers[counter]
  counter -= 1
end

counter = 0
until counter == numbers.length
  p numbers[counter]
  counter +=1
end
