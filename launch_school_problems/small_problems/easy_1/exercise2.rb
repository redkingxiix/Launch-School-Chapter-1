def is_odd? number
  number = number.to_i
  if number % 2 == 0
    return true
  else
    return false
  end
end

p is_odd?(10)
p is_odd?(9)
