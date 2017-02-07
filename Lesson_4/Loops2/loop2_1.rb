count = 1

loop do
  if count.odd?
    p "#{count} is odd!"
  else
    p "#{count} is even!"
  end
  break if count >= 5
  count += 1
end

