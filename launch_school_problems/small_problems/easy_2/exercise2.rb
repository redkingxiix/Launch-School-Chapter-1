def room length,width
  room_meters = length * width
  room_feet = (room_meters * 10.7639)
  p "The area of the room is #{room_meters} square meters (#{room_feet} feet)"

end


p "Enter a length in meters:"
length = gets.chomp.to_i
p "Enter a width in meters:"
width = gets.chomp.to_i

room(length, width)
