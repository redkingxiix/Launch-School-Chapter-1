require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('tic_tac_toe.yml')

WIN_CONDITION_ONE = ['a','b','c']
WIN_CONDITION_TWO = ['1','2','3']

def message(message,lang = 'en')
  MESSAGES[lang][message]
end
  
def prompt(text)
  puts "=>#{text}"
end

def player_choice(board_number, board_data)
  if empty_or_valid_choice?(board_number,board_data)
    board_data[board_number] = "O"
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
  board_data.each do |k,_|
    return true if board_data[k].empty?
  end
end

def winner?(board_data,xo)
  winner = false
  WIN_CONDITION_ONE.each do |x|
    if board_data[x+'1'] == xo && board_data[x+'2'] == xo  && board_data[x+'3'] == xo 
      winner = true
     end
  end

  WIN_CONDITION_TWO.each do |x|
    if board_data['a'+x] == xo && board_data['b'+x] == xo && board_data['c'+x] == xo
      winner = true
    end
  end

  if board_data["a1"] == xo && board_data["b2"] == xo && board_data["c3"] == xo 
    winner = true
  elsif board_data["c1"] == xo && board_data["b2"] == xo && board_data["a3"] == xo 
    winner = true
  end
  winner
end

def print_board(board_data)
  print "    #{board_data["a1"]} | #{board_data["a2"]} | #{board_data["a3"]} 
  ___ ___ ___
    #{board_data["b1"]} | #{board_data["b2"]} | #{board_data["b3"]} 
  ___ ___ ___
    #{board_data["c1"]} | #{board_data["c2"]} | #{board_data["c3"]} 
  "
end

play_again = true
while play_again

  board_data = {
    "a1" => "", "a2" => "", "a3" => "",
    "b1" => "", "b2" => "", "b3" => "",
    "c1" => "", "c2" => "", "c3" => "",
    }
  game_over = false
  while !game_over
    break if !any_free_spaces?(board_data)
      print_board(board_data)
      choice = gets.chomp
      while !player_choice(choice,board_data)
        prompt("That's not gold kid")
        choice = gets.chomp
      end
      break if winner?(board_data,'x') || winner?(board_data,'O')
  end
  print_board(board_data)
  input = gets.chomp.to_s
  if input == 'yes'
    play_again = false
  end
end
