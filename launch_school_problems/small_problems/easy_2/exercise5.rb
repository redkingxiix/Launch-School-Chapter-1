def hello name
  if name.split("").last == "!"
    p "HELLO #{name.upcase}! WHY ARE YOU YELLING"
  else
    p "Hello #{name}"
  end
end




p "What's your name?"
name = gets.chomp.to_s
hello(name)
