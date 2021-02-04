CREATE OR ALTER PROC addGame(@team1 INT, @team2 INT, @start_date DATETIME, @end_date DATETIME)
AS
DECLARE @TRC INT = @@TRANCOUNT
IF @TRC=0
	BEGIN TRAN Tr1
ELSE
	SAVE TRAN Tr1
BEGIN TRY
	IF @end_date < @start_date
		DECLARE @a INT=1/0

	IF (SELECT COUNT(id) FROM teams WHERE id=@team1 OR id=@team2) <> 2
		DECLARE @b INT=1/0



	DECLARE @id INT
	DECLARE @table table (id INT)
					PRINT 'tttt'
	INSERT INTO games 
		(start_date, end_date)
	OUTPUT inserted.id INTO @table
	VALUES
		(@start_date, @end_date)

	SELECT @id = id FROM @table

	INSERT INTO teams_games
		(game_id, team_id, is_home)
	VALUES
		(@id, @team1, @team2)
	
	IF @TRC=0
		COMMIT TRAN
END TRY
BEGIN CATCH
	IF @TRC=0
		ROLLBACK TRAN
	ELSE
		IF XACT_STATE() <> -1
			ROLLBACK TRAN Tr1
	RAISERROR('error happend',1,1)
END CATCH
