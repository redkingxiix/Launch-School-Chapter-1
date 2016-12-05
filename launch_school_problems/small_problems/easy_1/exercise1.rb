def repeat number, string
  number = number.to_i
  number.times do
    p string
  end
end

repeat(10, "hello")
repeat("test","test")
