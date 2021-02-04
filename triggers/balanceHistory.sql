CREATE OR ALTER TRIGGER balanceHistory
ON users
AFTER UPDATE
AS
	INSERT INTO balance_history
	(user_id, balance, timestamp)
	(SELECT id, balance, GETDATE()
	FROM deleted)
