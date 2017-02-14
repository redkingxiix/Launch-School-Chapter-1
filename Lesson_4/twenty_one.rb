require 'pry'


def initialize_deck
  suits = ['S','D','H','C']
  suits.map{|suit|
    final_suit = []
    2.upto(10) do |i|
      final_suit.concat([suit, i.to_s])
    end
    final_suit
  }
end
deck =  initialize_deck
    
