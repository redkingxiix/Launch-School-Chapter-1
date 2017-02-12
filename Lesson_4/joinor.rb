require 'pry'
def joinor(arr, punc, con = 'or') # array, punctuation, connective
  if arr.size <= 1
    return arr.first.to_s
  elsif arr.size == 2
    return arr.insert(1, con).join(' ')
  else
    last_digit = arr.pop.to_s
    con = ' '+con+' '
    return new_sentence = arr.join("#{punc}") << con << last_digit
  end
end


arr = [1,2]
arr2 = [1,2,3,4]
arr3 = [1,2,3,4,5,6,7]

p joinor(arr, ', ', 'and')
p joinor(arr2, ', ')
p joinor(arr3, ', ', 'and')
