CREATE OR ALTER PROC refreshBalances
AS
DECLARE @TRC INT = @@TRANCOUNT
IF @TRC=0
	BEGIN TRAN Tr1
ELSE
	SAVE TRAN Tr1
BEGIN TRY
	DECLARE @table TABLE (id INT)

	INSERT INTO @table
	SELECT b.id 
	FROM bets AS b
	JOIN games AS g ON g.id=b.game_id AND g.start_date < GETDATE()
	WHERE withdrawn=0

	IF (NOT EXISTS (SELECT 1 FROM @table))
		DECLARE @a INT=1/0

	 UPDATE users
	 SET balance += o.value*b.ammount
	 FROM bets b
	 JOIN odds AS o ON o.game_id=b.game_id AND o.team_id=b.team_id
	 WHERE b.id IN (SELECT id FROM @table)

	 UPDATE bets
	 SET withdrawn=1
	 FROM games AS g 
	 WHERE b.id IN (SELECT id FROM @table)

	 IF @TRC=0
		COMMIT TRAN
END TRY
BEGIN CATCH
	IF @TRC=0
		ROLLBACK TRAN
	ELSE
		IF XACT_STATE() <> -1
			ROLLBACK TRAN Tr1
	RAISERROR('Insufficent balance, or incorect game_id',1,1)
END CATCH