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

  def route_win_increase(result)
    result == 1 ? @player_1.increase_current_wins : @player_2.increase_current_wins
  end

  def increase_current_round
    @current_round += 1
  end
  
  #Checks to see if a player has clinched a series win.
  #Takes in 3 arguements - player_1.currnet_wins, player_2.currnet_wins, and series_length
  #Returns a string drescribing a player as a winner if player.current_wins > series_length/2
  def clinched_series?
    clinch_num = @series_length/2.0
    @player_1.current_wins > (clinch_num) || @player_2.current_wins > (clinch_num) ? winner = true : winner = false
  end

  #Determines which player wins the match.
  #Takes in two valid moves as strings
  #Returns a string drescribing the outcome of the match.
  def return_winner
    winner = ''
      if player_1.current_move.downcase == 'rock'     && player_2.current_move.downcase == 'scissors' ||
        player_1.current_move.downcase == 'scissors'  && player_2.current_move.downcase == 'paper' ||
        player_1.current_move.downcase == 'paper'     && player_2.current_move.downcase == 'rock'
        winner = 1

      elsif player_2.current_move.downcase == 'rock'  && player_1.current_move.downcase == 'scissors' ||
        player_2.current_move.downcase == 'scissors'  && player_1.current_move.downcase == 'paper' ||
        player_2.current_move.downcase == 'paper'     && player_1.current_move.downcase == 'rock'
        winner = 2
      else
        winner = 3
      end
  end

#Reports the result of an individual round
#Takes in a non-tie result integer (1 or 2)
#Returns a sting while pulling player.name and player.current_move attributes from the game.players.
  def report_round_winner(result)
    report = ''
    if result == 1
      report = "ROUND #{@current_round}---#{@player_1.name}'s #{@player_1.current_move.upcase} beats #{@player_2.name}'s #{@player_2.current_move.upcase}"
    elsif result == 2
      report = "ROUND #{@current_round}---#{@player_2.name}'s #{@player_2.current_move.upcase} beats #{@player_1.name}'s #{@player_1.current_move.upcase}"
    end
  end

#Reports the outcome of the series
#Takes in a game object as input. Checks to see if player.current_wins is greater than half the series length.
#Returns a string description of the outcome if there is one.
  def report_series_winner(game)
    outcome = ''
    if @player_1.current_wins > @player_2.current_wins
      outcome = "#{@player_1.name} wins the series!"
    elsif @player_2.current_wins > @player_1.current_wins
      outcome = "#{@player_2.name} wins the series!"
    end
    outcome
  end
end
