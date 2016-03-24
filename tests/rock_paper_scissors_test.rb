require 'test_helper'
require_relative '../lib/rock_paper_scissors.rb'

class RockPaperScissorsTest < Minitest::Test

  def test_valid_answer_with_r
    move = 'r'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_capitol_R
    move = 'R'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_s
    move = 's'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_capitol_scissors
    move = 'Scissors'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_p
    move = 'R'
    actual = valid_move?(move)
    assert_equal(true, actual, "'true' as a boolean should be returned.")
  end

  def test_valid_answer_with_rock
    move = 'Rake'
    actual = valid_move?(move)
    refute_equal(true, actual, "'false' as a boolean should be returned.")
  end
end
