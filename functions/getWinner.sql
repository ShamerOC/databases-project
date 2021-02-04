CREATE OR ALTER FUNCTION getWinner(@game_id INT)
RETURNS INT
AS
BEGIN
 DECLARE @endDate DATETIME;
 DECLARE @result INT
 SET @result=-1
 SET @endDate = (SELECT end_date FROM games WHERE id=@game_id)
 IF (@endDate < GETDATE())
 BEGIN
  DECLARE @host INT
  DECLARE @guest INT
  SET @host=(SELECT team_id FROM teams_games WHERE game_id=@game_id AND is_home=1)
  SET @guest=(SELECT team_id FROM teams_games WHERE game_id=@game_id AND is_home=0)
  DECLARE @host_goals INT;
  DECLARE @guest_goals INT;
  SET @host_goals = (SELECT COUNT(id)
				FROM goals
				WHERE game_id=@game_id AND team_id=@host)
  SET @guest_goals = (SELECT COUNT(id)
				FROM goals
				WHERE game_id=@game_id AND team_id=@guest)
   IF (@host_goals > @guest_goals) SET @result=@host
   ELSE IF (@host_goals < @guest_goals) SET @result=@guest
   ELSE SET @result=0		
 END
 RETURN @result
END