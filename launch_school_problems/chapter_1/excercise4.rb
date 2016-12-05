movies = { men_in_black: 1998, 
           rashamon: 1970, 
           eien_no_zero: 2014, 
           old_boy:2001 }

new_movie_array = []

movies.each do |k,v|
  new_movie_array.push(v)
end

new_movie_array.each do |movie|
  p movie
end
