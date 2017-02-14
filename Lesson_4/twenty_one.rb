require 'pry'


def initialize_deck
  suits = ['S','D','H','C']
  deck = []
  suits.map{|suit|
    cards= []
    2.upto(10) do |i|
      cards<< [suit, i.to_s]
    end
    deck += cards
    }
    deck
end
    deck =  initialize_deck
   p deck 
