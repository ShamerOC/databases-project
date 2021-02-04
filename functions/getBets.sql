CREATE OR ALTER FUNCTION getBets(@game_id INT)
RETURNS TABLE
AS
RETURN(
 SELECT u.login, o.value AS course, b.ammount, CAST((o.value * b.ammount) AS MONEY) AS win, t.name, b.date
 FROM bets AS b
 JOIN users AS u ON b.user_id=u.id
 JOIN odds AS o ON o.game_id=b.game_id AND o.team_id=b.team_id
 JOIN teams AS t ON t.id=b.team_id
 WHERE b.game_id=@game_id
);