def tip_calculator(bill, percentage)
  tip = bill * percentage * 0.01
  total = tip + bill

  p "The tip is #{tip}"
  p "The bill is #{total}"
end

p "What's the bill?"
bill = gets.chomp.to_f
p "What's the percentage?"
per = gets.chomp.to_f

tip_calculator(bill, per)
