require 'pry'
#Tells us if our rock-paper-scissors move is valid.
#
#Takes in a string as an argeument and compares it to the strings "rock", "paper", and "scissors"
#
#Returns true if valid or false if not valid.
  def valid_move?(move)
    valid = ['r', 'rock', 'p', 'paper', 's', 'scissors']
    valid.include? move.downcase
  end


#Tells us who our Rock,Paper,Scissor winner is.
#
#Takes in a valid argu
#
#
def return_winner(move1, move2)
end
