require_relative("../models/team.rb")
require_relative("../models/league.rb")

League.delete_all()
Team.delete_all()

league1 = League.new(
  {
    "league_name" => "Smite Pro League"
  }
)

league1.save()

team1 = Team.new(
  {
    "team_name" => "Rival",
    "league_id" => league1.id
  }
)

team1.save()

team2 = Team.new(
  {
    "team_name" => "Pittsburgh Knights",
    "league_id" => league1.id
  }
)

team2.save()
