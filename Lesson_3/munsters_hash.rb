munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }


def munsters_age_hash(munsters)
  munsters.each do |k,_|
    case munsters[k]["age"]
    when 0..17
      munsters[k]["age_group"] = "kid"
    when 18..64
      munsters[k]["age_group"] = "adult"
    else
      munsters[k]["age_group"] = "senior"
    end
  end
  munsters
end

p munsters_age_hash(munsters)


