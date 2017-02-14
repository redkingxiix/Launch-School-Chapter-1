require 'pry'


def initialize_deck
  suits = ['S','D','H','C']
  deck = []
  suits.map{|suit|
    cards= []
    1.upto(13) do |i|
      i = case i
      when 1 then 'Ace'
      when 11 then 'Jack'
      when 12 then 'Queen'
      when 13 then 'King'
      else
        i
      end
      cards<< [suit, i.to_s]
    end
    deck += cards
    }
    deck
end
    deck =  initialize_deck
   p deck 
