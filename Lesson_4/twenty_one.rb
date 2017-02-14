require 'pry'
HIGH_CARDS = ['Jack','Queen','King']

#  def initialize_deck
#    suits = ['S','D','H','C']
#    deck = []
#    suits.map{|suit|
#      cards= []
#      1.upto(13) do |i|
#        i = case i
#        when 1 then 'Ace'
#        when 11 then 'Jack'
#        when 12 then 'Queen'
#        when 13 then 'King'
#        else
#          i
#        end
#        cards<< [suit, i.to_s]
#      end
#      deck += cards
#      }
#      binding.pry
#      deck
#  end
#  Ordered by suit
def initialize_deck
  suits = ['S','D','H','C']
  suits.map!{|suit|
    deck = []
    1.upto(13) do |i|
      i = case i
      when 1 then 'Ace'
      when 11 then 'Jack'
      when 12 then 'Queen'
      when 13 then 'King'
      else
        i
      end
      deck<< [suit, i.to_s]
    end
    deck
    }
end

def calculate(hand)
  total_value = 0
  hand.each_with_index do |card, index|
    card_value = card[index-1][i]
    value = 0
    if FACE_CARDS.any? {|face| face == card_value }
      value = 10
    else
      value = card_value.to_i
    end
    total_value += value
  end

  if total_value > 21
  end
end

deck =  initialize_deck
p deck
