def any_number(number)
  case
  when number <= 50
      p "Your number is greater or equal to 0 and less than or equal to 50"
  when  number <= 100
      p "Your number is greater or equal to 51 and less than or equal to 100"
  else
    p "Please use numbers inbetween 100 and 0"
  end
end

p "Enter a number between 0 and 100"
no = gets.chomp.to_i
any_number(no)

