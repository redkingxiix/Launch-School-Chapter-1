require 'pry'
HIGH_CARDS = ['Jack','Queen','King']
player_hand = []
dealer_hand = []

def prompt(message)
p ("=>#{message}")
end

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
#Ordered by suit
#def initialize_deck
#  suits = ['S','D','H','C']
#  suits.map!{|suit|
#    deck = []
#    1.upto(13) do |i|
#      i = case i
#      when 1 then 'Ace'
#      when 11 then 'Jack'
#      when 12 then 'Queen'
#      when 13 then 'King'
#      else
#        i
#      end
#      deck<< [suit, i.to_s]
#    end
#    deck
#    }
#end

def calculate(hand)
  total_value = 0
  ace_counter = 0

  hand.each do |card|
    card_value = card[1]
    value = 0
    if HIGH_CARDS.any? do |face| face == card_value end
      value = 10
    elsif
      card_value = 'Ace'
      ace_counter += 1
    else
      value = card_value.to_i
    end
    total_value += value
  end

  ace_counter.times do
    total_value + 11
  end

  if total_value > 21
    ace_counter.times do
      total_value - 10
      break if total_value < 21
    end
  end
end

def deal_cards(deck)
  hand = []
  2.times do 
    card = deck.sample
    hand << card
    deck.delete(card)
  end
  hand
end

loop do
  
end

deck =  initialize_deck
player_hand = deal_cards(deck)
