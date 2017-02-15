require 'pry'
HIGH_CARDS = ['Jack', 'Queen', 'King']
player_hand = []
dealer_hand = []
SUITS = { 'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades' }

def prompt(message)
  p "=>#{message}"
end

def initialize_deck
  suits = SUITS.keys
  deck = []
  suits.map do |suit|
    cards = []
    1.upto(13) do |i|
      i = case i
          when 1 then 'Ace'
          when 11 then 'Jack'
          when 12 then 'Queen'
          when 13 then 'King'
          else
            i
          end
      cards << [suit, i.to_s]
    end
    deck += cards
  end
  deck
end
#  Ordered by suit
#  def initialize_deck
#    suits = ['S','D','H','C']
#    suits.map!{|suit|
#      deck = []
#      1.upto(13) do |i|
#        i = case i
#        when 1 then 'Ace'
#        when 11 then 'Jack'
#        when 12 then 'Queen'
#        when 13 then 'King'
#        else
#          i
#        end
#        deck<< [suit, i.to_s]
#      end
#      deck
#      }
#  end

def calculate(hand)
  total_value = 0
  ace_counter = 0

  hand.each do |card|
    card_value = card[1]
    value = 0
    if HIGH_CARDS.any? { |face| face == card_value }
      value = 10
    elsif card_value == 'Ace'
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
      total_value -= 10
      break if total_value < 21
    end
  end
end

def deal_cards(deck, no)
  hand = []
  no.times do
    card = deck.sample
    hand << card
    deck.delete(card)
  end
  hand
end

def show_cards(p_hand)
  hand = []
  p_hand.each do |card|
    value = card[1]
    suit = SUITS[card[0]]
    punc = value == 'Ace' ? 'an' : 'a'
    hand << "#{punc} #{value} of #{suit}"
  end
  prompt("You have #{joinor(hand, ',')}")
end

def joinor(arr, punc, con = 'and') # array, punctuation, connective
  return 'NO CARDS' if arr.size <= 0
  if arr.size <= 1
    return arr.first.to_s
  elsif arr.size == 2
    return arr.insert(1, con).join(' ')
  else
    last_digit = arr.pop.to_s
    con = ' ' + con + ' '
    return arr.join(punc) << con << last_digit
  end
end

prompt('Welcome to Blackjack!')
loop do
  loop do
    deck = initialize_deck
    player_hand = deal_cards(deck, 2)
    dealer_hand = deal_cards(deck, 2)
    show_cards(player_hand)
  end
  prompt('Would you like to play again?')
  answer = gets.chomp
  break if answer.downcase.start_with?('y')
end
