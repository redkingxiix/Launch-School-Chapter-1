def sum numbers
  num_array = numbers.to_s.split('').to_a
  total = 0
  num_array.length.times do |x|
    total += num_array.pop.to_i
  end
  p total
end


sum(23)
sum(469)
sum(123_456_789)
