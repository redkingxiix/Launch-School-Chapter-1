vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']


def occurrences obs
  answer = Hash.new(0).tap{|h| obs.each{ |ob| h[ob] +=1}}
  p answer
end

 occurrences(vehicles)
