create or alter procedure fibonacci @num int
	AS
		BEGIN
			DECLARE @begin INT SET @begin = 0
			DECLARE @i_1 INT SET @i_1 = 0
			DECLARE @i_2 INT SET @i_2 = 1

			PRINT 'Fibonacci Series';
		
			DECLARE @j INT SET @j = 0
			While(@j < @num)
			BEGIN
			Print @begin + ' ';
			SET @i_1 = @i_2
			SET @i_2 = @begin
			SET @begin = @i_1 + @i_2

			SET @j = @j + 1;
			END
		END;

EXEC fibonacci @num = 10;


    