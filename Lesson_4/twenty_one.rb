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
    total_value += 11
  end

  if total_value > 21
    ace_counter.times do
      total_value -= 10
      break if total_value < 21
    end
  end
  total_value
end

def bust(val)
  val > 21
end

def who_won?(p_val, d_val)
  return 'You win!' if d_val > 21
  return 'Dealer wins!' if p_val > 21
  if p_val > d_val
    return 'You win!'
  else
    return 'Dealer wins!'
  end
end

def deal_cards(deck, hand = [])
  no = hand.length == 0 ? 2 : 1
  no.times do
    card = deck.sample
    hand << card
    deck.delete(card)
  end
  hand
end

def show_cards(p_hand, player = true, show_down = false)
  hand = []
  who = show_down ? "Dealer's" : 'Your'
  p_hand.each_with_index do |card, index|
    value = card[1]
    suit = SUITS[card[0]]
    punc = ['Ace', '8'].include?(value) ? 'an' : 'a'
    hand << "#{punc} #{value} of #{suit}"
    break if !player && index >= 1
  end
  if player || show_down
    prompt("#{who} hand: #{joinor(hand, ',')}.")
    prompt("#{who} total value: #{calculate(p_hand)}.")
  else
    dealer_hand = []
    dealer_hand << hand.first
    other_cards = p_hand.length > 2 ?  "and #{p_hand.count} cards.": "and another card."
    dealer_text = "Dealer has #{joinor(dealer_hand, ' , ')} #{other_cards}"
    prompt(dealer_text)
  end
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

def dealer_should_stick?(val) 
  return false if val < 16
  true
end

prompt('Welcome to Blackjack!')
loop do
  deck = initialize_deck
  player_hand = deal_cards(deck)
  dealer_hand = deal_cards(deck)
  dealer_stuck = false
  player_stuck = false
  d_val = 0
  p_val = 0
  show_cards(player_hand)
  show_cards(dealer_hand, false)
 
  loop do
    d_value = calculate(dealer_hand)
    dealer_hand = deal_cards(deck, dealer_hand)
    unless dealer_should_stick?(d_value) || dealer_stuck
      dealer_hand = deal_cards(deck, dealer_hand)
    end
    unless player_stuck
      answer = ''
      loop do
        prompt('Would you like to stick? "y" for yes, "n" for no.')
        answer = gets.chomp.downcase
        break if answer == 'y'|| answer == 'n'
      end
      if answer == 'n'
        player_hand = deal_cards(deck, player_hand)
      else
        player_stuck = true
      end
    end
    show_cards(player_hand)
    show_cards(dealer_hand, false)
    p_val  = calculate(player_hand)
    d_val = calculate(dealer_hand)
    system 'clear'
    break if bust(p_val) || bust(d_val) || (player_stuck && dealer_stuck)
  end
  show_cards(player_hand)
  show_cards(dealer_hand, false, true)
  prompt(who_won?(p_val, d_val))
  prompt('Would you like to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
