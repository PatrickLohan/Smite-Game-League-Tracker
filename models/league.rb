require_relative('../db/sql_runner.rb')
require_relative('./team.rb')

class League
  attr_accessor :league_name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @league_name = options['league_name']
  end

  def save()
    sql = "INSERT INTO leagues
    (league_name) VALUES ($1)
    RETURNING id"
    values = [@league_name]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM leagues WHERE id= $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM leagues"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE leagues SET league_name = $1 WHERE id = $2"
    values = [league_name, id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(league_data)
    return league_data.map { |league| League.new(league) }
  end

  def self.all()
    sql = "SELECT * FROM leagues"
    league_data = SqlRunner.run(sql)
    leagues = map_items(league_data)
    return leagues
  end

  def self.find(id)
    sql = "SELECT * FROM leagues WHERE id = $1"
    values = [id]
    league_hash = SqlRunner.run(sql, values).first()
    league = League.new(league_hash)
    return league
  end

  def teams()
    sql = "SELECT * FROM teams WHERE league_id = $1"
    values = [@id]
    teams = SqlRunner.run(sql, values)
    return teams.map{ |team| Team.new(team) }
  end


end
