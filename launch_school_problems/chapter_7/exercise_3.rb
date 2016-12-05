def print_hash_values hash
  hash.each do |k,v|
    puts v
  end
end

def print_hash_keys hash
  hash.each do |k,v|
    puts k
  end
end

def print_hash_keys_and_values hash
  hash.each do |k,v|
    puts "key:#{k}"
    puts "value:#{v}"
  end
end

dummy_hash = {a:"hey",b:"ho",c:"hi",d:"yo"}

print_hash_values(dummy_hash)
print_hash_keys(dummy_hash)
print_hash_keys_and_values(dummy_hash)
