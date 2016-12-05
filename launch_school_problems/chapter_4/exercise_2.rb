def upcase word
  unless word.to_s.length < 10  
    p word.to_s.upcase
  else
    p word.to_s
  end
end
p "Hey, say something."
something = gets.chomp
upcase(something)
