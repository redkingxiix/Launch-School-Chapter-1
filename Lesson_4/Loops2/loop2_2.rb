loop do
  number = rand(100)
  puts number
  break if number >= 0 && number <= 10
end

#ALTERNATIVE FACT
#loop do
#  number = rand(100)
#  puts number
#
#  if number.between?(0, 10)
#    break
#  end
#end
