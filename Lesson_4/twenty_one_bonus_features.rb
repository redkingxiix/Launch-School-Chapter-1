require 'pry'
SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
player_tally = 0
dealer_tally = 0

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
    true
  when :dealer_busted
    prompt "Dealer busted! You win!"
    false
  when :player
    prompt "You win!"
    true
  when :dealer
    prompt "Dealer wins!"
    false
  when :tie
    prompt "It's a tie!"
  end
end

def tally_reached?(p_tally, d_tally)
  if p_tally == 5
    prompt('Congratulations! You got five wins!')
    true
  elsif d_tally == 5
    prompt('Oh no! the dealer got five wins...!')
    true
  else
    false
  end
end

def play_again?(p_tally, d_tally)
  unless tally_reached?(p_tally, d_tally)
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
  else
    false
  end
end

def grand_output(d_cards, p_cards, d_score, p_score)
  puts "=============="
  prompt "Dealer has #{d_cards}, for a total of: #{d_score}"
  prompt "Player has #{p_cards}, for a total of: #{p_score}"
  puts "=============="
end

loop do
  prompt "Welcome to Twenty-One!"
  prompt "The current tally is  You: #{player_tally} : Dealer #{dealer_tally}"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  player_score = 0
  dealer_score = 0

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
    player_score = total(player_cards)
    dealer_score = total(dealer_cards)
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_score}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      player_score = total(player_cards)
      prompt "Your total is now: #{player_score}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    grand_output(dealer_score, player_score, dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)
    dealer_tally+=1
    play_again?(player_tally, dealer_tally) ? next : break
  else
    prompt "You stayed at #{player_score}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_score >= 17

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_score = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_score}"
    grand_output(dealer_score, player_score, dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)
    player_tally += 1
    play_again?(player_tally, dealer_tally) ? next : break
  else
    prompt "Dealer stays at #{dealer_score}"
  end

  # both player and dealer stays - compare cards!
  grand_output(dealer_score, player_score, dealer_cards, player_cards)
  tally = display_result(dealer_cards, player_cards)
  unless tally.nil?
    tally ? player_tally+=1 : dealer_tally+=1
  end
  #this play again is different because it come naturally at the end of the loop. it also uses
  #an unless statement where as the other two use the method as a tenery operator
  break unless play_again?(player_tally, dealer_tally)
end

prompt "Thank you for playing Twenty-One! Good bye!"
