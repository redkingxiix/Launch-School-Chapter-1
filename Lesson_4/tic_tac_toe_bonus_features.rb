require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diags
CHOOSE = ['choose', 'player', 'computer']

def prompt(msg)
  puts "=> #{msg}"
end

def choose(choice)
  if choice == "p"
    1
  elsif choice == 'c'
    2
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts " You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def joinor(arr, punc, con = "or") # array, punctuation, connective
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(plr)
  case plr
  when 'player' then 'computer'
  when 'computer' then 'player'
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  return if computer_offensive_move(brd)
  return if computer_defensive_move(brd)
  return if computer_center_move(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def computer_center_move(brd)
  return false if brd[5] != INITIAL_MARKER
  brd[5] = COMPUTER_MARKER
  true
end

def computer_defensive_move(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      line.each do |value|
        next unless brd[value] == INITIAL_MARKER
        brd[value] = COMPUTER_MARKER
        return true
      end
    end
  end
  false
end

def computer_offensive_move(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      line.each do |value|
        next unless brd[value] == INITIAL_MARKER
        brd[value] = COMPUTER_MARKER
        return true
      end
    end
  end
  false
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_score = 0
computer_score = 0
current_player = ''
starter = ''
prompt("Who will go first? Type 'c' or Computer or 'p' for Player:")

loop do
  starter = gets.chomp
  if starter.downcase.start_with?('p', 'c')
    starter = choose(starter)
    current_player = CHOOSE[starter]
    break
  else
    prompt('Invalid choice. Type "c" for Computer or "p" for Player')
  end
end

loop do
  board = initialize_board

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    case detect_winner(board)
    when 'Player' then player_score += 1
    when 'Computer' then computer_score += 1
    end
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "The score is You: #{player_score} | Computer: #{computer_score}"
  break if (computer_score == 5) ||
           (player_score == 5)
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe!"
prompt "The final score is You: #{player_score} | Computer: #{computer_score}"
