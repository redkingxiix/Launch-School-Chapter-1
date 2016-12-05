def sum_or_product(number, sop)
  case sop
  when "s"
    i = 0
    number.times do
      p i
      i+=(i+1)
    end
    p "The sum of integers between 1 and #{number} is #{i}"
  when "p"
    i = 1
    number.times do |x|
      i = (x+1) * i
    end
    p "The product of integers between 1 and #{number} is #{i}"
  end
end

p "Please enter a number greater than 0"
no = gets.chomp.to_i
p "Enter 's' to compute the sum, 'p' to compute the product."
sop = gets.chomp.to_s

sum_or_product(no,sop)
