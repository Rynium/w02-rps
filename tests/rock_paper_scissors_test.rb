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
    game.set_player_1(Player.new("Ryan"))
    game.set_player_2(Player.new("Don"))
    game.player_1.current_move = "rock"
    game.player_2.current_move = "scissors"
    actual = game.return_winner
    assert_equal(1, actual, "'1' as an integer should be returned.")
  end

  def test_return_winner_scissors_rock
    game = Game.new
    game.set_player_1(Player.new("Ryan"))
    game.set_player_2(Player.new("Don"))
    game.player_1.current_move = "scissors"
    game.player_2.current_move = "rock"
    actual = game.return_winner
    assert_equal(2, actual, "'2' as an integer should be returned.")
  end

  def test_return_winner_scissors_scissors
    game = Game.new
    game.set_player_1(Player.new("Ryan"))
    game.set_player_2(Player.new("Don"))
    game.player_1.current_move = "scissors"
    game.player_2.current_move = "scissors"
    actual = game.return_winner
    assert_equal(3, actual, "'3' as an integer should be returned.")
  end

    def test_return_winner_paper_scissors
      game = Game.new
      game.set_player_1(Player.new("Ryan"))
      game.set_player_2(Player.new("Don"))
      game.player_1.current_move = "paper"
      game.player_2.current_move = "scissors"
      actual = game.return_winner
      assert_equal(2, actual, "'2' as an integer should be returned.")
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

    def test_report_round_winner_p1_paper_rock
      game = Game.new
      game.set_player_1(Player.new("Ryan"))
      game.set_player_2(Player.new("Don"))
      game.current_round = 7
      game.player_1.current_move = 'paper'
      game.player_2.current_move = 'rock'
      actual = game.report_round_winner(1)
      expected = "ROUND 7---Ryan's PAPER beats Don's ROCK"
      assert_equal(expected, actual, "'#{expected}' as an integer should be returned.")
    end

    def test_refute_clinched_series
      game = Game.new
      game.set_player_1(Player.new("Ryan"))
      game.set_player_2(Player.new("Don"))
      game.series_length = 7
      game.player_1.current_wins= 3
      game.player_2.current_wins= 3
      actual = game.clinched_series?
      refute_equal(true, actual, "'false' as a boolean should be returned.")
    end

    def test_assert_clinched_series_7
      game = Game.new
      game.set_player_1(Player.new("Ryan"))
      game.set_player_2(Player.new("Don"))
      game.series_length = 7
      game.player_1.current_wins= 4
      game.player_2.current_wins= 3
      actual = game.clinched_series?
      assert_equal(true, actual, "'true' as a boolean should be returned.")
    end

    def test_assert_clinched_series_11
      game = Game.new
      game.set_player_1(Player.new("Ryan"))
      game.set_player_2(Player.new("Don"))
      game.series_length = 11
      game.player_1.current_wins= 6
      game.player_2.current_wins= 1
      actual = game.clinched_series?
      assert_equal(true, actual, "'true' as a boolean should be returned.")
    end
end
