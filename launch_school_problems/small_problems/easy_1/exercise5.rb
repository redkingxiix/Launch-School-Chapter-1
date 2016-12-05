p "Enter some words with a space."
words = gets.chomp.to_s

def reverse_it sentence

  arr =  sentence.split('').to_a
  p arr.reverse.join('').to_s
end

reverse_it(words)
