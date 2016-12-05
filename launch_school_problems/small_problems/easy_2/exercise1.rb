def teddy_age
 age = Random.new
 return age.rand(1...200)
end

p "Teddy is #{teddy_age}"
