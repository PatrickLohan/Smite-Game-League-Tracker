require_relative('../db/sql_runner.rb')

class Team

  attr_reader :id
  attr_accessor :team_name, :league_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @team_name = options['team_name']
    @league_id = options['league_id'].to_i
  end

  def save()
    sql = "INSERT INTO teams
    (team_name, league_id) VALUES ($1, $2)
    RETURNING id"
    values = [@team_name, @league_id]
    result = SqlRunner.run(sql, values)
    #why is this written .first["id"] rather than .first("id")?
    id = result.first["id"]
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end


end
