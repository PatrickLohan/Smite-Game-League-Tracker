DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS leagues;

CREATE TABLE leagues (
  id SERIAL PRIMARY KEY,
  league_name VARCHAR(255)
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name VARCHAR(255),
  league_id INT REFERENCES leagues(id) ON DELETE CASCADE
);

CREATE TABLE players (
       id SERIAL PRIMARY KEY,
       game_name VARCHAR(255),
       team_id INT REFERENCES teams(id) ON DELETE CASCADE
);
