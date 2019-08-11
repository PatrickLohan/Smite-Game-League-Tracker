require('minitest/autorun')
require('minitest/rg')
require_relative('../models/league.rb')

class LeagueTest < MiniTest::Test

  def setup()
    @league1 = League.new("Minor League")
  end

  def test_update()
    @league1.update("Major League")
    assert_equal("Major League", @league1.name)
  end


end
