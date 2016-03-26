require_relative 'test_helper'
require_relative '../lib/rock_paper_scissors.rb'
require_relative '../lib/player.rb'

class RockPaperScissorsTest < Minitest::Test

  #tests that rock is a valid move
  def test_valid_move_with_rock
    game = Game.new
    move = 'rock'
    actual = game.valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  #tests that Rock is a valid move
  def test_valid_move_with_capitol_rock
    game = Game.new
    move = 'Rock'
    actual = game.valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  #tests that scissoRS is a valid move
  def test_valid_move_with_scissors
    game = Game.new
    move = 'scissoRS'
    actual = game.valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  #tests that Scissors is a valid move
  def test_valid_move_with_capitol_scissors
    game = Game.new
    move = 'Scissors'
    actual = game.valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  #tests that paper is a valid move
  def test_valid_move_with_p
    game = Game.new
    move = 'paper'
    actual = game.valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  #tests that Rake will show up as an invalid move.
  def test_invalid_answer
    game = Game.new
    move = 'Rake'
    actual = game.valid_move?(move)
    refute_equal(true, actual, "'false' as a boolean should be returned.")
  end

  def test_return_winner_rock_scissors
    game = Game.new
    actual = game.return_winner("rock", 'scissors')
    assert_equal(1, actual, "'1' as an integer should be returned.")
  end

  def test_return_winnerscissors_rock
    game = Game.new
    actual = game.return_winner('scissors', 'rock')
    assert_equal(2, actual, "'2' as an integer should be returned.")
  end

  def test_return_winner_scissors_scissors
    game = Game.new
    actual = game.return_winner("scissors", "scissors")
    assert_equal(3, actual, "'3' as an integer should be returned.")
  end

    def test_return_winner_paper_scissors
      game = Game.new
      actual = game.return_winner("paper", "scissors")
      assert_equal(2, actual, "'2' as a string should be returned.")
    end

    def test_log_round
      game = Game.new
      game.log_new_round("ROUND 12---Jay's SCISSORS beats Ryan's PAPER")
      expected = "ROUND 12---Jay's SCISSORS beats Ryan's PAPER"
      actual = game.game_log[0]
      assert_equal(expected, actual, "'#{expected}' as a string should be returned.")
    end

    def test_setting_player_1
      game = Game.new
      player = Player.new("Ryan")
      game.set_player_1(player)
      actual = game.player_1.name
      assert_equal('Ryan', actual, "'Ryan' as a string should be returned.")
    end

    def test_setting_player_2
      game = Game.new
      player = Player.new("Bob")
      game.set_player_1(player)
      actual = game.player_1.name
      assert_equal('Bob', actual, "'Bob' as a string should be returned.")
    end

    def test_winner_player_Don_beats_Ryan
      game = Game.new
      game.series_length = 9

      game.set_player_1(Player.new("Ryan"))
      game.player_1.current_wins = 4

      game.set_player_2(Player.new("Don"))
      game.player_2.current_wins = 5

      actual = game.clinched_series
      assert_equal(true, actual, "'true' as an boolean should be returned.")
    end

    def test_winner_player_Ryan_beats_Don
      game = Game.new
      game.series_length = 11

      game.set_player_1(Player.new("Ryan"))
      game.player_1.current_wins = 6

      game.set_player_2(Player.new("Don"))
      game.player_2.current_wins = 2

      actual = game.clinched_series
      assert_equal(true, actual, "'true' as an boolean should be returned.")
    end

    def test_report_winner_p1_paper_rock
      game = Game.new
      actual = game.report_winner(1, "Ryan", "paper", "Jay", "rock", 7)
      expected = "ROUND 7---Ryan's PAPER beats Jay's ROCK"
      assert_equal(expected, actual, "'#{expected}' as an integer should be returned.")
    end

    def test_report_winner_p2_scissors_paper
      game = Game.new
      actual = game.report_winner(2, "Ryan", "paper", "Jay", "scissors", 7)
      expected = "ROUND 7---Jay's SCISSORS beats Ryan's PAPER"
      assert_equal(expected, actual, "'#{expected}' as an integer should be returned.")
    end
end
