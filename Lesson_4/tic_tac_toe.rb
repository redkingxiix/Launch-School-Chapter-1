require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('tic_tac_toe.yml')

WIN_CONDITION_ONE = ['a', 'b', 'c']
WIN_CONDITION_TWO = ['1', '2', '3']
lang = ""

def message(message, lang)
  MESSAGES[lang][message]
end

def prompt(text)
  puts "=>#{text}"
end

def choice(board_number, board_data, xo)
  if empty_or_valid_choice?(board_number, board_data)
    board_data[board_number] = xo
  else
    return false
  end
end

def empty_or_valid_choice?(k, board_data)
  if board_data[k]
    board_data[k].empty?
  end
end

def any_free_spaces?(board_data)
  board_data.each do |k, _|
    return true if board_data[k].empty?
  end
end

def winner?(board_data, xo)
  winner = false
  WIN_CONDITION_ONE.each do |x|
    if board_data[x + '1'] == xo && board_data[x + '2'] == xo && board_data[x + '3'] == xo
      winner = true
    end
  end

  WIN_CONDITION_TWO.each do |x|
    if board_data['a' + x] == xo && board_data['b' + x] == xo && board_data['c' + x] == xo
      winner = true
    end
  end

  if board_data['a1'] == xo && board_data['b2'] == xo && board_data['c3'] == xo
    winner = true
  elsif board_data['c1'] == xo && board_data['b2'] == xo && board_data['a3'] == xo
    winner = true
  end
  winner
end

def print_board(board_data)
  print "    #{board_data['a1']} | #{board_data['a2']} | #{board_data['a3']}
  ___ ___ ___
    #{board_data['b1']} | #{board_data['b2']} | #{board_data['b3']}
  ___ ___ ___
    #{board_data['c1']} | #{board_data['c2']} | #{board_data['c3']}
  "
end

def computer_turn(board_data)
  computer = ""
  loop do
    computer = ['a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3'].sample
   break if empty_or_valid_choice?(computer, board_data)
  end
  choice(computer, board_data, "X")
end

input = ''
loop do
  prompt(message('language', 'en'))
  lang = gets.chomp
  if lang == "1"
    lang = "en"
    break
  elsif lang == "2"
    lang = "ja"
    break
  end
end

prompt(message('welcome', lang))

while (input != "1") || (input != "2")
  input = gets.chomp
  if input == "1"
    prompt(message('rules', lang))
    break
  elsif input == "2"
    break
  else
    prompt(message('wrong_answer1', lang))
  end
end

input = ''
play_again = true

while play_again
  board_data = {
    "a1" => "", "a2" => "", "a3" => "",
    "b1" => "", "b2" => "", "b3" => "",
    "c1" => "", "c2" => "", "c3" => ""
  }

  game_over = false
  while !game_over
    break if !any_free_spaces?(board_data)
    print_board(board_data)
    player_choice = gets.chomp

    while !choice(player_choice, board_data, "O")
      prompt(message('invalid',lang))
      player_choice = gets.chomp
    end

    computer_turn(board_data)
    break if winner?(board_data, 'X') || winner?(board_data, 'O')
  end

  print_board(board_data)

  if winner?(board_data, "O")
    prompt(message('win', lang))
  elsif winner?(board_data, "X")
    prompt(message('lose', lang))
  else
    prompt(message('draw', lang))
  end

  input = ''
  loop do
    prompt(message('again', lang))
    input = gets.chomp.to_s
    if input == '2'
      prompt(message('goodbye', lang))
      play_again = false
      break
    elsif input == '1'
      prompt(message('again', lang))
      break
    end
  end
end
