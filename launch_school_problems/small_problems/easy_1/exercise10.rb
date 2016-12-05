
def calculate_bonus number, bool
  if bool
    return number.to_i / 2
  else
    return 0
  end
end


p calculate_bonus(2800, true)
p calculate_bonus(1000, false)
p calculate_bonus(50000, true)
