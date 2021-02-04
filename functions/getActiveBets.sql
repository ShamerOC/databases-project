CREATE OR ALTER FUNCTION getActiveBets(@user_id INT)
RETURNS TABLE
AS 
RETURN (
  SELECT b.id, b.ammount, t.name, b.ammount AS bet, (b.ammount * o.value) AS win
  FROM bets AS b
  JOIN teams AS t ON t.id=b.team_id
  JOIN odds AS o ON o.game_id=b.game_id AND o.team_id=b.team_id
  WHERE b.user_id=@user_id AND b.withdrawn=0
)