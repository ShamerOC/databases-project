CREATE OR ALTER TRIGGER goalAfterGameEnd
ON goals
AFTER INSERT
AS
	DECLARE @game INT = (SELECT game_id FROM inserted)
	IF (SELECT end_date FROM games WHERE id=@game) < GETDATE()
	BEGIN
		ROLLBACK
		RAISERROR('Game has already ended',1,1)
	END
