#Figure out the total age of just the male members of the family.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

def average_male_age(munster_hash)
  total_age = 0
  munster_hash.each do |k,_|
    case munster_hash[k]["gender"]
    when "male"
      total_age+= munster_hash[k]["age"]
    when "female"
      next
    end
  end
  total_age
end

p average_male_age(munsters)
