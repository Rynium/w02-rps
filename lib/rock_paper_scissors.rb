require 'pry'

def valid_move?(move)
  valid = ['rock', 'paper', 'scissors']
  valid.include? move.downcase
end

def get_move(player)
  puts "\n#{player}, what is your weapon of choice?\n"
  move = gets.chomp
  while !valid_move?(move)
    puts "\n#{player}, what is your VALID weapon of choice?\n"
    move = gets.chomp
  end
  move
end

def return_winner(player_1, player_2)
    winner = ''
    if player_1 == 'rock'     && player_2 == 'scissors' ||
       player_1 == 'scissors' && player_2 == 'paper' ||
       player_1 == 'paper'    && player_2 == 'rock'
       winner = 'player_1'

     elsif player_2 == 'rock' && player_1 == 'scissors' ||
       player_2 == 'scissors' && player_1 == 'paper' ||
       player_2 == 'paper' && player_1 == 'rock'
       winner = 'player_2'

     else
      winner = 'tie'
     end
end

def rock_paper_scissors(p1_name, p1_move, p2_name, p2_move)
  champ = return_winner(p1_move,p2_move)
end
binding.pry
