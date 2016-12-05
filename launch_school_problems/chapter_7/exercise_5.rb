def contains_values value, hash
  hash.each do |k,v|
    if value == v 
      p "True"
      break
    else
      p "False"
      break
    end
  end
end

dummy_hash = {a:"hey",b:"yo",c:"hi"}

contains_values("hey",dummy_hash )
contains_values("should return false", dummy_hash)
