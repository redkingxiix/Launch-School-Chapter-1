def retire(age, retire_age)
  year = Time.new.year.to_i
  years_left =  retire_age - age
  retire_in = year + years_left

  p "It's #{year}. You will retire in #{retire_in}."
  p "You only have #{years_left} to go."
end

p "What is your age?"
age = gets.chomp.to_i
p "At what age would you like to retire?"
retire_age = gets.chomp.to_i

retire(age, retire_age)
