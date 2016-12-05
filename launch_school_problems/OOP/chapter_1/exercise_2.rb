module Bojack
  def horseman(name)
    puts "I'm #{name} the horseman, #{name} the horseman, don't act like you don't know"
  end
end

class Horse
  include Bojack
  def neigh
    puts "neigh"
  end
end

uma = Horse.new
uma.horseman("Bojack")
uma.neigh

