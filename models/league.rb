require_relative('../db/sql_runner.rb')

class League
  attr_reader :id, :league_name

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
    #why is this written .first["id"] rather than .first("id")?
    id = result.first["id"]
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM leagues"
    SqlRunner.run(sql)
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



end
