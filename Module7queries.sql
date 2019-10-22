UPDATE teams SET abbreviation = 'WAS' WHERE abbreviation = 'WSH';

SELECT startTime, homeScore, awayScore
FROM games
WHERE startTime >= '2019-06-06 00:00:00' AND startTime <= '2019-06-06 17:00:00';

SELECT *
FROM teams
WHERE league = 'NL';



SELECT CONCAT  (p.firstName, ' ', p.lastName) AS FullName, t.mascot, p.position, p.hits, p.throws, t.abbreviation
FROM players p, teams t
WHERE t.id = p.currentTeamId AND t.mascot = "Red Sox";

SELECT CONCAT (p.firstName, ' ', p.lastName) AS FullName, p.position, (SELECT t.abbreviation FROM teams t WHERE t.id = p.currentTeamId) AS abbreviation, hs.homeRuns
FROM players p,   hittingStats hs, games g
WHERE p.id = hs.playerId AND g.id = hs.gameId AND g.startTime >= '2019-06-06 00:00:00' AND startTime <='2019-06-06 23:59:59'
ORDER BY hs.homeRuns DESC LIMIT 5;

SELECT CONCAT (p.firstName, ' ', p.lastName) AS FullName, (SELECT t.abbreviation FROM teams t WHERE t.id = p.currentTeamId) AS abbreviation, ps.inningsPitched
FROM players p, pitchingStats ps, games g 
WHERE p.id = ps.playerId AND g.id = ps.gameId AND g.startTime >= '2019-06-06 00:00:00' AND startTime <='2019-06-06 23:59:59' AND ps.inningsPitched >= 4
ORDER BY ps.earnedRuns ASC LIMIT 5; 

SELECT CONCAT (p.firstName, ' ', p.lastName) AS FullName,
 p.position, (SELECT t.abbreviation FROM teams t WHERE t.id = p.currentTeamId) AS abbreviation, hs.doubles, 
  (SELECT t.abbreviation FROM teams t WHERE t.id = g.homeTeamId) AS homeTeam,
   (SELECT t.abbreviation FROM teams t WHERE t.id = g.awayTeamId) AS awayTeam
FROM players p, hittingStats hs, games g
WHERE p.id = hs.playerId AND g.id = hs.gameId AND g.startTime >= '2019-06-06 00:00:00' AND startTime <='2019-06-06 23:59:59'
ORDER BY hs.doubles DESC LIMIT 1;