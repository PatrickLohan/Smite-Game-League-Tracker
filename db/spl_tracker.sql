DROP TABLE teams;
DROP TABLE leagues;

CREATE TABLE leagues (
  id SERIAL PRIMARY KEY,
  league_name VARCHAR(255)
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name VARCHAR(255),
  league_id INT REFERENCES leagues(id) ON DELETE CASCADE
);
