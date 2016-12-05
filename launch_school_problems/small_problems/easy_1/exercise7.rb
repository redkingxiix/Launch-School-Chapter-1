
def stringy number
 answer = ""
 i =0
  while i <  number do
    i%2 == 0? answer.concat("1") : answer.concat("0")
    i+=1
  end
  p answer
end
  
stringy(6)
stringy(9)
stringy(4)
stringy(7)
