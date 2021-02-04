CREATE OR ALTER VIEW avalible_bets AS
WITH CTE 
AS (
 SELECT DISTINCT tg.game_id, (
 SELECT t.name 
 FROM teams_games AS tg1
 JOIN teams AS t ON t.id = tg1.team_id
 WHERE game_id = tg.game_id AND is_home = 1
 ) AS team_1,
 (
 SELECT t.name 
 FROM teams_games AS tg1
  JOIN teams AS t ON t.id = tg1.team_id
 WHERE game_id = tg.game_id AND is_home = 0
 ) AS team_2
 FROM teams_games AS tg
)

SELECT cte.team_1 AS home, cte.team_2 AS away, g.start_date, g.end_date
FROM games AS g
JOIN CTE as cte ON cte.game_id = g.id
WHERE GETDATE() < g.start_date