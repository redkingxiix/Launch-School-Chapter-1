def recursion num
  if num == 0 
    p "Finished"
  else
  p num
  recursion(num - 1)
  end
end

p "Enter a number:"
number = gets.chomp.to_i
recursion(number)

