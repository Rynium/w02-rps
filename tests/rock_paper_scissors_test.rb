require 'test_helper'
require_relative '../lib/rock_paper_scissors.rb'

class RockPaperScissorsTest < Minitest::Test

  def test_valid_answer_with_rock
    move = 'rock'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_capitol_rock
    move = 'Rock'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_s
    move = 'scissoRS'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_capitol_scissors
    move = 'Scissors'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_p
    move = 'paper'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_invalid_answer
    move = 'Rake'
    actual = valid_move?(move)
    refute_equal(true, actual, "'false' as a boolean should be returned.")
  end

  def test_return_winner_rock_rock
    actual = return_winner('rock', 'rock')
    assert_equal('tie', actual, "'tie' as a string should be returned.")
  end

  def test_return_winner_rock_scissors
    actual = return_winner('rock', 'scissors')
    assert_equal('player_1', actual, "'player_1' as a string should be returned.")
  end

  def test_return_winner_rock_scissors
    actual = return_winner('paper', 'scissors')
    assert_equal('player_2', actual, "'player_2' as a string should be returned.")
  end

  def test_get_name
    actual = get_name('Ryan')
    assert_equal('Ryan', actual, "'Ryan' as a string should be returned.")
  end
end
