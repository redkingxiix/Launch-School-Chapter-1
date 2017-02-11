

loop do
  process_the_loop = [true, false].sample
  if process_the_loop == true
    p "The loop was processed"
    break
  else
    p "The loop wasn't processed"
  end
end

##ALTERNATIVE FACTS
##process_the_loop = [true, false].sample
#
#if process_the_loop
#  loop do
#    puts "The loop was processed!"
#    break
#  end
#else
#  puts "The loop wasn't processed!"
#end
