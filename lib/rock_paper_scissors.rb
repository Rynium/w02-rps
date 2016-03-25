require 'pry'
require_relative 'player.rb'



class Game
  attr_accessor :current_round, :game_log, :player_1, :player_2, :series_length

  def initialize()
    @current_round = 1
    @series_length = 1
    @game_log = []
    @player_1 = nil
    @player_2 = nil
  end

  #Tests if a move is valid.
  #Takes move a string as input.
  #Outputs true if the string is 'rock','paper', or 'scissors'
    def valid_move?(move)
    valid = ['rock', 'paper', 'scissors']
    valid.include? move.downcase
  end

  #Determines which player wins the match.
  #Takes in two valid moves as strings
  #Returns a string drescribing the outcome of the match.
  def return_winner(p1_name, p1_move, p2_name, p2_move, n)
    winner = ''
      if p1_move.downcase == 'rock'     && p2_move.downcase == 'scissors' ||
        p1_move.downcase == 'scissors' && p2_move.downcase == 'paper' ||
        p1_move.downcase == 'paper'    && p2_move.downcase == 'rock'
        winner = "ROUND #{n}---#{p1_name}'s #{p1_move.upcase} beats #{p2_name}'s #{p2_move.upcase}"

      elsif p2_move.downcase == 'rock' && p1_move.downcase == 'scissors' ||
        p2_move.downcase == 'scissors' && p1_move.downcase == 'paper' ||
        p2_move.downcase == 'paper' && p1_move.downcase == 'rock'
        winner = "ROUND #{n}---#{p2_name}'s #{p2_move.upcase} beats #{p1_name}'s #{p1_move.upcase}"

      else
        winner = 'tie'
      end
  end

  #Logs a battle round in to the game_log
  #Takes a String as an arguement
  #Pushes the string into @game_log
  def log_new_round(round)
    @game_log.push(round)
  end

  #Sets player_1 attribute equal to a player and sets the game equal the game attribute under player.
  #Takes in a player as an arguement
  #Sets player_1 equal to an instance of a Player object.
  def set_player_1(player_1)
    @player_1 = player_1
    player_1.game = self
  end

  #Sets player_2 attribute equal to a player and sets the game equal the game attribute under player.
  #Takes in a player as an arguement
  #Sets player_2 equal to an instance of a Player object.
  def set_player_2(player_2)
    @player_2 = player_2
    player_2.game = self
  end

  #Checks to see if a player has clinched a series win.
  #Takes in 3 arguements - player_1.currnet_wins, player_2.currnet_wins, and series_length
  #Returns a string drescribing a player as a winner if player.current_wins > series_length/2
  def clinched_series(series_length, p1_wins, p2_wins)
    clinch_num = series_length/2.0
    winner = 0
    if p1_wins > (clinch_num)
      winner = 1
    elsif p2_wins > (clinch_num)
      winner = 2
    end
    winner
  end

  def valid_series_length(num)
    num % 2 != 0 ? true : false
  end
end


binding.pry
