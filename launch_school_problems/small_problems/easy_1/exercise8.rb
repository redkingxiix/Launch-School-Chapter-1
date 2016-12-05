


def user_array
  number_array = []
  numbers = gets.chomp
  while numbers != "stop"
    number_array.push(numbers.to_i)
    numbers = gets.chomp
  end
  return number_array
end

def array_average arr
  total = 0

  arr.each do |no|
    total += no
  end

  unless total == 0
  total = total / arr.count
  p total
  else
    p "can't divide by zero dummy!"
  end
end





p "enter numbers. type 'stop' when you're finished"
array = user_array
array_average(array)
