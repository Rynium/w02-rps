require 'pry'
require_relative 'lib/rock_paper_scissors.rb'
require_relative 'lib/player.rb'

def get_name(player)
  puts "\n#{player}, what is your battle name?\n"
  name = gets.chomp
  while name.length <= 0
    puts "\n#{player}, what is your VALID battle name?\n"
    name = gets.chomp
  end
  name
end

def get_series_length
  puts "\nHow many games would you like your series to be?\n"
  rounds = gets.chomp.to_i
  while rounds.even?
    puts "\nHow many games would you like your series to be? Remember it needs to be an ODD NUMBER.\n"
    rounds = gets.chomp.to_i
  end
  rounds
end

def get_move(player,game)
  puts "\n#{player}, what is your weapon of choice?\n"
  move = gets.chomp
  while !game.valid_move?(move)
    puts "\n#{player}, what is your VALID weapon of choice?\n"
    move = gets.chomp
  end
  move
end

def current_moves(p1,p2,game)
  p1.current_move = get_move(p1.name, game)
  p2.current_move = get_move(p2.name, game)
  result = game.return_winner
  puts "Tie...let's reshoot until we have a winner!" if result == 3
  result
end


def generate_non_tie(p1,p2,game)
  result = current_moves(p1,p2,game)
  while result == 3
    result = current_moves(p1,p2,game)
  end
  result
end

print "\n\nWELCOME TO THE WORLD SERIES OF ROCK,PAPER,SCISSORS on ESPN 8 'THE OCHO'\n\n"
game = Game.new
p1 = Player.new(get_name("Player 1"))
p2 = Player.new(get_name("Player 2"))
game.current_round = 1
game.series_length = get_series_length
game.set_player_1(p1)
game.set_player_2(p2)

while !game.clinched_series?
  puts "\n\n#{game.player_1.name}(#{p1.current_wins}) vs #{game.player_2.name}(#{p2.current_wins})\nRound #{game.current_round} of #{game.series_length}\n"
  result = generate_non_tie(p1,p2, game)
  report = game.report_round_winner(result)
  game.route_win_increase(result)
  game.log_new_round(report)
  game.game_log.each {|x| puts x}
  game.increase_current_round
end
puts game.report_series_winner(game)
