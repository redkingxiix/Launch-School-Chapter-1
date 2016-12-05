def digit_list number
  number = number.to_s.split('')
  num_array = []
  number.each do |x|
    num_array.push(x.to_i)
  end
  return num_array
end

p digit_list(100000)
p digit_list(90897)
p digit_list(100)
p digit_list(254)
