family =  {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select{|k|
  k == :sisters || k == :brothers
}
p family
p immediate_family.values.flatten
