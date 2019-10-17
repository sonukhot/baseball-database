CREATE DATABASE baseball;

USE baseball;
DROP TABLE team;
CREATE TABLE team (
    team_abbreviation VARCHAR (3),
    name VARCHAR(255),
    mascot VARCHAR (255),
    location VARCHAR (255),
    league VARCHAR(3),
    division VARCHAR (2),
    createdAT DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAT DATETIME DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
    deletedAT DATETIME,
PRIMARY KEY (team_abbreviation)
);

CREATE TABLE player (
    player_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    position VARCHAR (2),
    throws VARCHAR (1),
    hits VARCHAR (1),
    team_abbreviation VARCHAR(3),
    createdAT DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAT DATETIME DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
    deletedAT DATETIME,
PRIMARY KEY (player_id),
FOREIGN KEY (team_abbreviation) REFERENCES team (team_abbreviation)
);

CREATE TABLE game (
    game_id INT AUTO_INCREMENT,
    home_team_abbreviation VARCHAR(3),
    away_team_abbreviation VARCHAR(3),
    startedAT DATETIME,
    home_team_abbreviation_score INT,
    away_team_abbreviation_score INT,
    createdAT DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAT DATETIME DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
    deletedAT DATETIME,
PRIMARY KEY (game_id),
FOREIGN KEY (home_team_abbreviation) REFERENCES team (team_abbreviation),
FOREIGN KEY (away_team_abbreviation) REFERENCES team (team_abbreviation)
);

CREATE TABLE hitter (
    game_id INT,
    player_id INT,
    at_bats INT,
    runs INT,
    hits INT,
    doubles INT,
    triples INT,
    homeruns INT,
    runs_batted INT,
    walks INT,
    strikeouts INT,
    steals INT,
    wins VARCHAR(1),
    createdAT DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAT DATETIME DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
    deletedAT DATETIME,
PRIMARY KEY (player_id, game_id),
FOREIGN KEY (player_id) REFERENCES player (player_id),
FOREIGN KEY (game_id) REFERENCES game (game_id)
);

CREATE TABLE pitcher(
    game_id INT,
    player_id INT,
    inningsPitched INT,
    hits INT,
    runs INT,
    earnedruns INT,
    walks INT,
    strikeouts INT,
    wins VARCHAR(1),
    createdAT DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAT DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletedAT DATETIME,
PRIMARY KEY (player_id, game_id),
FOREIGN KEY (player_id) REFERENCES player (player_id),
FOREIGN KEY (game_id) REFERENCES game (game_id)
);

);