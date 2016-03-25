require 'pry'
require_relative 'lib/rock_paper_scissors.rb'
require_relative 'lib/player.rb'


def get_move(player)
  puts "\n#{player}, what is your weapon of choice?\n"
  move = gets.chomp
  while !game.valid_move?(move)
    puts "\n#{player}, what is your VALID weapon of choice?\n"
    move = gets.chomp
  end
  move
end

def get_name(player)
  puts "\n#{player}, what is your battle name?\n"
  name = gets.chomp
  while name <= 0
    puts "\n#{player}, what is your VALID battle name?\n"
    name = gets.chomp
  end
  name
end

def get_series_length(player)
  puts "\nHow many games would you like your series to be?\n"
  move = gets.chomp
  while !game.valid_series_length?(move)
    puts "\nHow many games would you like your series to be? Remember it needs to be an ODD NUMBER.\n"
    move = gets.chomp
  end
  move
end

print "\n\nWELCOME TO THE WORLD SERIES OF ROCK,PAPER,SCISSORS on ESPN 8 'THEE OCHO'\n\n"
game = Game.new
