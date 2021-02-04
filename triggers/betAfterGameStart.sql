CREATE OR ALTER TRIGGER betAfterGameStart
ON goals
AFTER INSERT
AS
	DECLARE @game INT = (SELECT game_id FROM inserted)
	IF (SELECT start_date FROM games WHERE id=@game) < GETDATE()
	BEGIN
		ROLLBACK
		RAISERROR('Game has started',1,1)
	END