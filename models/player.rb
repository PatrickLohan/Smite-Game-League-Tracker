require_relative('../db/sql_runner.rb')

class Player
  attr_reader :id
  attr_accessor :game_name, :team_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @game_name = options['game_name']
    @team_id = options['team_id']
  end

  def save()
    sql = "INSERT INTO players
    (game_name, team_id)
    VALUES ($1, $2) RETURNING id"
    values = [@game_name, @team_id]
    result = SqlRunner.run(sql, values)
    id = result.first()['id']
    @id = id.to_i()
  end

  def delete()
    sql = "DELETE FROM players WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM players"
    SqlRunner.run(sql)
  end
  
  def self.map_items(player_data)
    return player_data.map { |player| Player.new(player) }
  end

  def self.all()
    sql = "SELECT * FROM players"
    player_data = SqlRunner.run(sql)
    players = map_items(player_data)
    return players
  end

  def self.find(id)
    sql = "SELECT * FROM players WHERE id = $1"
    values = [id]
    player_hash = SqlRunner.run(sql, values)[0]
    return Player.new(player_hash)
  end

  def update()
    sql = "UPDATE players SET (game_name, team_id) = $1 WHERE id = $2"
    values = [@team_id, @id]
    SqlRunner.run(sql, values)
  end

end
