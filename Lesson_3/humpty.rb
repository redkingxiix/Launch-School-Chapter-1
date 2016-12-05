sentence = "Humpty Dumpty sat on a wall."


def each_word(sentence)
  return sentence.split
end

def join_word(sentence)
  return sentence.join(" ")
end

p sentence = each_word(sentence)
p sentence = join_word(sentence)

