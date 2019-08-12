require('minitest/autorun')
require('minitest/rg')
require_relative('../models/team.rb')
require_relative('../models/league.rb')

class TeamTest < MiniTest::Test

  def setup()
    @team1 = Team.new("Rival", 1)
    @team2 = Team.new("PK", 1)
    @league1 = League.new("SPL")
    @League2 = League.new("MLG")
  end

end
