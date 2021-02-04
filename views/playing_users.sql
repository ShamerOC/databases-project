CREATE OR ALTER VIEW playing_users AS
SELECT b.game_id, u.login, b.ammount, t.name AS bet_on
FROM bets AS b
JOIN users AS u ON b.id=u.id
JOIN teams AS t On b.team_id=t.id
WHERE b.withdrawn=0