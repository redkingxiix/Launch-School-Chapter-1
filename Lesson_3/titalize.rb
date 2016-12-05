words = "the flintstones rock"

def titalize(words)
  split = words.split
  finished_sentence = ""
  split.each_with_index do |word, index|
    word[0] = word[0].upcase!
    finished_sentence += word
    finished_sentence += " " unless split.length == index
  end
  finished_sentence
end

p titalize(words)
