munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}



def print_munster(munster)
  munster.each do |name, details|
    p "#{name} is a #{details["age"]} #{details["gender"]}"
  end
end

print_munster(munsters)
