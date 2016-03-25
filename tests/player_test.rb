require_relative 'test_helper'
require_relative '../lib/player.rb'
require_relative '../lib/rock_paper_scissors.rb'

class PlayerTest < Minitest::Test

  def test_current_wins
    player = Player.new(name:'Ryan')
    player.current_wins=(2)
    actual = player.current_wins
    assert_equal(2, actual, "'2' as an integer should be returned.")
  end

  def test_current_wins_and_reset
    player = Player.new(name:'Ryan')
    player.current_wins=(2)
    actual = player.current_wins
    assert_equal(2, actual, "'2' as an integer should be returned.")

    player.reset_current_wins
    actual = player.current_wins
    assert_equal(0, actual, "'0' as an integer should be returned.")
  end


end
