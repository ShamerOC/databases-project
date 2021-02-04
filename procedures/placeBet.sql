CREATE OR ALTER PROC placeBet(@user_id INT, @game_id INT, @team_id INT, @value MONEY)
AS
DECLARE @TRC INT = @@TRANCOUNT
IF @TRC=0
	BEGIN TRAN Tr1
ELSE
	SAVE TRAN Tr1
BEGIN TRY
	UPDATE users SET balance -= @value
	WHERE id=@user_id

	IF (SELECT COUNT(team_id) FROM teams_games WHERE team_id=@team_id AND game_id=@game_id) < 1
		DECLARE @a INT =1/0

	INSERT INTO bets
		(user_id, game_id, team_id, ammount, date, withdrawn)
	VALUES
		(@user_id, @game_id, @team_id, @value, GETDATE(), 0)
		
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
