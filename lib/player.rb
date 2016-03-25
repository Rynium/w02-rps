
require_relative 'rock_paper_scissors.rb'


class Player
  attr_accessor :name, :current_move, :current_wins

  def initialize(name)
    @name = name
    @current_move = ''
    @current_wins = 0
  end

  #Increase the amount of wins for the current player by 1.
  def increase_current_wins
    @current_wins += 1
  end

  # resets the amont of current_wins to 0
  def reset_current_wins
    @current_wins = 0
  end

end
