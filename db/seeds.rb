require_relative("../models/team.rb")
require_relative("../models/league.rb")
require_relative("../models/player.rb")

Player.delete_all()
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

player1 = Player.new(
  {
    "game_name" => "PolarBearMike",
    "team_id" => 1
  }
)

player1.save()

player2 = Player.new(
  {
    "game_name" => "Emilzy",
    "team_id" => 2
  }
)

player2.save()
