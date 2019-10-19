CREATE DATABASE baseball;

USE baseball;

CREATE TABLE teams
(
    id INT
    AUTO_INCREMENT,
    location VARCHAR
    (255),
    mascot VARCHAR
    (255),
    abbreviation VARCHAR
    (3),
    league ENUM
    ('AL','NL') NOT NULL,
    division ENUM
    ('East', 'Central', 'West') NOT NULL,
    createdAT DATETIME DEFAULT NOW
    (),
    updatedAT DATETIME DEFAULT NOW
    (),
    deletedAT DATETIME,
PRIMARY KEY
    (id)
);

    CREATE TABLE games
    (
        id INT
        AUTO_INCREMENT,
    homeTeamId INT NOT NULL ,
    awayTeamId INT NOT NULL,
    homeScore INT,
    awayScore INT,
    startTime TIMESTAMP NOT NULL,
    createdAT DATETIME DEFAULT NOW
        (),
    updatedAT DATETIME DEFAULT NOW
        (),  
    deletedAT DATETIME,
PRIMARY KEY
        (id),
FOREIGN KEY
        (homeTeamId) REFERENCES teams
        (id),
FOREIGN KEY
        (awayTeamId) REFERENCES teams
        (id)
);

        CREATE TABLE players
        (
            id INT
            AUTO_INCREMENT,
    firstName VARCHAR
            (255),
    lastName VARCHAR
            (255),
    position ENUM
            ('SP', 'RP','C','1B','2B','3B','SS','CF','LF','RF','DH'),
    throws ENUM
            ('R','L','B'),
    hits ENUM
            ('R','L','B'),
    currentTeamID INT NOT NULL,
    createdAT DATETIME DEFAULT NOW
            (),
    updatedAT DATETIME DEFAULT NOW
            (),
    deletedAT DATETIME,
PRIMARY KEY
            (id),
FOREIGN KEY
            (currentTeamId) REFERENCES teams
            (id)
);

            CREATE TABLE hitterStats
            (
                playerId INT NOT NULL,
                gameId INT NOT NULL,
                teamId INT NOT NULL,
                atBats INT DEFAULT 0,
                runs INT DEFAULT 0,
                hits INT DEFAULT 0,
                doubles INT DEFAULT 0,
                triples INT DEFAULT 0,
                homeRuns INT DEFAULT 0,
                runsBattedIn INT DEFAULT 0,
                walks INT DEFAULT 0,
                strikeOuts INT DEFAULT 0,
                steals INT DEFAULT 0,
                wins TINYINT DEFAULT 0,
                createdAT DATETIME DEFAULT NOW(),
                updatedAT DATETIME DEFAULT NOW(),
                deletedAT DATETIME,
                PRIMARY KEY (playerId, gameId),
                FOREIGN KEY (playerId) REFERENCES players (id),
                FOREIGN KEY (gameId) REFERENCES games (id),
                FOREIGN KEY (teamId) REFERENCES teams (id)
            );

            CREATE TABLE pitcherStats
            (
                playerId INT NOT NULL,
                gameId INT NOT NULL,
                teamId INT NOT NULL,
                wins TINYINT DEFAULT 0,
                inningsPitched DECIMAL (3,1),
                hits INT DEFAULT 0,
                runs INT DEFAULT 0,
                earnedRuns INT DEFAULT 0,
                walks INT DEFAULT 0,
                strikeouts INT DEFAULT 0,
                createdAT DATETIME DEFAULT NOW(),
                updatedAT DATETIME DEFAULT NOW() ,
                deletedAT DATETIME,
                PRIMARY KEY (playerId, gameId),
                FOREIGN KEY (playerId) REFERENCES players (id),
                FOREIGN KEY (gameId) REFERENCES games (id),
                FOREIGN KEY (teamId) REFERENCES teams (id)
            );
