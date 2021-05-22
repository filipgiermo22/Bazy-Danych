-- 1. blok œredniego wynagrodzenia
BEGIN 
SELECT AVG(Rate) AS Œrednia_stawka FROM HumanResources.EmployeePayHistory
SELECT * FROM HumanResources.Employee AS Emp
	JOIN HumanResources.EmployeePayHistory AS Hist ON Emp.BusinessEntityID = Hist.BusinessEntityID
	WHERE Rate < (SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory)
END;


-- 2. funkcja zwraca date wysylki po ID
GO
CREATE OR ALTER FUNCTION SendDate(@id INT)
RETURNS VARCHAR(255)
BEGIN
	DECLARE @duedate DATETIME
	SELECT @duedate = (SELECT DueDate FROM Purchasing.PurchaseOrderDetail WHERE PurchaseOrderDetailID = @id);
	DECLARE @output varchar(225)
	SET @output = CONCAT('ID zamowienia: ', @id, '; data wysylki: ', @duedate)

	RETURN @output
END;
GO

SELECT dbo.SendDate(8);


-- 3.procedura wypisania danych produktu po nazwie
/*dodano lokalizacje produktu, to pozwala na jednoznacza indentyfikacje produktu*/
GO
CREATE OR ALTER PROCEDURE GetProdData(@name VARCHAR(255))
AS
SELECT P.ProductID, ProductNumber, Name, Quantity, LocationID, Shelf, Bin
	FROM Production.Product AS P 
		JOIN Production.ProductInventory AS PIn ON P.ProductID = PIn.ProductID WHERE Name = @name
GO

EXEC GetProdData @name = 'Blade';


-- 4.funkcja zwraca numer karty po zamowieniu
/*
CREATE OR ALTER FUNCTION GetCardNum(@ 
????
*/


-- 5. procedura dzielenia
GO
CREATE OR ALTER PROCEDURE Dzielenie (@num1 FLOAT, @num2 FLOAT)
AS
BEGIN
IF @num1 > @num2
	PRINT 'Wynik dzielenia: ' + CAST((@num1/@num2) AS VARCHAR(255));
ELSE
	PRINT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe';
	END
GO

EXEC Dzielenie @num1 = 3, @num2 = 2.434;


-- 6. procedura sk³adowana wypisuj¹ca stanowisko, urlop i chorobowe 
GO
CREATE OR ALTER PROCEDURE Stanowisko(@NationalID INT)
AS
SELECT JobTitle AS title, VacationHours AS Vacation_hours, SickLeaveHours AS Sick_Leave_hours FROM HumanResources.Employee
	WHERE NationalIDNumber = @NationalID;
GO

EXEC Stanowisko @NationalID = 509647174;


-- 7. procedura kalkulatora walutowego
GO
CREATE OR ALTER PROCEDURE kalkulator(@kwota FLOAT, @waluta1 CHAR(3), @waluta2 CHAR(3), @data DATETIME)
AS
DECLARE @rate FLOAT
SELECT @rate = AverageRate FROM Sales.CurrencyRate WHERE ToCurrencyCode = @waluta2
PRINT @waluta1 + ': ' + CAST(@kwota AS VARCHAR(255)) + ' Rate: ' + CAST(@rate AS VARCHAR(255)) + ' ' + @waluta2 + ': ' + CAST(@kwota*@rate AS VARCHAR(255));
PRINT @waluta2 + ': ' + CAST(@kwota AS VARCHAR(255)) + ' Rate: ' + CAST(1/@rate AS VARCHAR(255)) + ' ' + @waluta1 + ': ' + CAST(@kwota*(1/@rate) AS VARCHAR(255));
GO
EXEC kalkulator @kwota=1300, @waluta1 = 'USD', @waluta2 = 'GBP', @data = '2011-06-25 00:00:00.000'



