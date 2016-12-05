def any_number(number)
  if number > 100 || number < 0
    p "Please use numbers inbetween 100 and 0"
  else
    if number >= 0 && number <= 50
      p "Your number is greater or equal to 0 and less than or equal to 50"
    elsif number >= 51 && number <= 100
      p "Your number is greater or equal to 51 and less than or equal to 100"
    end
  end
end

p "Enter a number between 0 and 100"
no = gets.chomp.to_i
any_number(no)

