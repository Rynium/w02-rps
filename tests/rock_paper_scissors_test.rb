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

  def test_return_winner_ryan_rock_jay_scissors_3
    game = Game.new
    expected = "ROUND 3---Ryan's ROCK beats Jay's SCISSORS"
    actual = game.return_winner("Ryan", "rock", "Jay", "scissors", 3)
    assert_equal(expected, actual, "'#{expected}' as a string should be returned.")
  end

  def test_return_winner_ryan_scissors_jay_rock_5
    game = Game.new
    expected = "ROUND 5---Jay's ROCK beats Ryan's SCISSORS"
    actual = game.return_winner("Ryan", "scissors", "Jay", "rock", 5)
    assert_equal(expected, actual, "'#{expected}' as a string should be returned.")
  end

  def test_return_winner_ryan_scissors_jay_scissors_5
    game = Game.new
    expected = "tie"
    actual = game.return_winner("Ryan", "scissors", "Jay", "scissors", 5)
    assert_equal(expected, actual, "'#{expected}' as a string should be returned.")
  end

    def test_return_winner_ryan_paper_jay_scissors_5
      game = Game.new
      expected = "ROUND 12---Jay's SCISSORS beats Ryan's PAPER"
      actual = game.return_winner("Ryan", "paper", "Jay", "scissors", 12)
      assert_equal(expected, actual, "'#{expected}' as a string should be returned.")
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

      game.set_player_1(Player.new("Ryan"))
      p1_wins = game.player_1.current_wins = 4

      game.set_player_2(Player.new("Don"))
      p2_wins = game.player_2.current_wins = 5

      actual = game.clinched_series(9, p1_wins, p2_wins)
      assert_equal(2, actual, "'2' as an integer should be returned.")
    end

    def test_winner_player_Ryan_beats_Don
      game = Game.new

      game.set_player_1(Player.new("Ryan"))
      p1_wins = game.player_1.current_wins = 6

      game.set_player_2(Player.new("Don"))
      p2_wins = game.player_2.current_wins = 2

      actual = game.clinched_series(11, p1_wins, p2_wins)
      assert_equal(1, actual, "'1' as an integer should be returned.")
    end

    def test_setting_player_2
      game = Game.new
      actual = game.valid_series_length?(3)
      assert_equal(true, actual, "'true' as a boolean should be returned.")
    end

    def test_setting_player_2
      game = Game.new
      actual = game.valid_series_length?(10)
      refute_equal(true, actual, "'false' as a boolean should be returned.")
    end


end
