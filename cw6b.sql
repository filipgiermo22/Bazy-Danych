USE firma

--a) dodanie +48 do numeru telefonu w tabeli pracownicy

UPDATE ksiegowosc.pracownicy SET num_telefonu = '+48' + num_telefonu;

--b) przedzielenie telefonow '-'

UPDATE ksiegowosc.pracownicy
    SET num_telefonu = CONCAT(SUBSTRING(num_telefonu,1,3),' ',SUBSTRING(num_telefonu,3,3),'-',SUBSTRING(num_telefonu,6,3),'-',SUBSTRING(num_telefonu,9,3));

--c) wypisanie pracownika z najdluzszym nazwiskiem wielkimi literami

SELECT TOP 1 UPPER(nazwisko) AS nazwisko
    FROM ksiegowosc.pracownicy
    ORDER BY len(nazwisko) DESC;

--d) dane i pensje w md5
/*
SELECT CONVERT(VARCHAR(32), HashBytes('MD5', CAST(id_pracownika AS VARCHAR)), 2) AS id_pracownika,
       CONVERT(VARCHAR(32), HashBytes('MD5', imie), 2) AS imie,
       CONVERT(VARCHAR(32), HashBytes('MD5',nazwisko), 2) AS nazwisko,
       CONVERT(VARCHAR(32), HashBytes('MD5', CAST(kwota AS VARCHAR)), 2) AS pensja
    FROM ksiegowosc.pracownicy
        JOIN ksiegowosc.pensje ON pensje.id_pensji = pracownicy.id_pracownika;
*/

SELECT HashBytes('MD5', CAST(id_pracownika AS VARCHAR)) AS id_pracownika,
       HashBytes('MD5', imie) AS imie,
       HashBytes('MD5',nazwisko) AS nazwisko,
       HashBytes('MD5', CAST(kwota AS VARCHAR)) AS pensja
    FROM ksiegowosc.pracownicy
        JOIN ksiegowosc.pensje ON pensje.id_pensji = pracownicy.id_pracownika;

--f) pracownicy, pensje, premie LEFT JOIN

SELECT pracownicy.id_pracownika, imie, nazwisko, pensje.kwota AS pensja, premie.kwota AS premia
    FROM ksiegowosc.pracownicy
        LEFT OUTER JOIN ksiegowosc.pensje ON pensje.id_pensji = pracownicy.id_pracownika
        LEFT OUTER JOIN ksiegowosc.premie ON premie.id_premii = pracownicy.id_pracownika;

--g) raporty

DECLARE @i INT
DECLARE @imie VARCHAR(50)
DECLARE @nazwisko VARCHAR(50)
DECLARE @data DATE
DECLARE @premia_kwota INT
DECLARE @pensja_kwota INT
DECLARE @nadgodziny INT

SET @i=1
WHILE (@i<=10)
BEGIN
    SELECT @nadgodziny = (liczba_godzin-160)*25 FROM ksiegowosc.godziny WHERE id_godziny = @i;
    SELECT @imie = imie, @nazwisko = nazwisko FROM ksiegowosc.pracownicy WHERE id_pracownika = @i;
    SELECT @data = data FROM ksiegowosc.godziny WHERE id_pracownika = @i;
    SELECT @premia_kwota = ISNULL(kwota, 0) FROM ksiegowosc.premie
            FULL OUTER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_premii = premie.id_premii WHERE id_pracownika = @i;
    SELECT @pensja_kwota = kwota FROM ksiegowosc.pensje
           FULL OUTER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji WHERE id_pracownika = @i;

    DECLARE @suma INT
        SET @suma = @pensja_kwota + @premia_kwota + @nadgodziny;

    PRINT 'Pracownik ' + @imie + ' ' + @nazwisko + ' w dniu ' + CAST(@data AS VARCHAR) +
          ' otrzymał pensję całkowitą na kwotę ' + CAST(@suma AS VARCHAR) +
          ' zł, gdzie wynagrodzenie zasadnicze wynosiło: ' + CAST(@pensja_kwota AS VARCHAR) +
          ' zł, premia: ' + CAST(ISNULL(@premia_kwota, '0') AS VARCHAR) + ' zł, nadgodziny: ' + CAST(@nadgodziny AS VARCHAR) +
          ' zł.'

    SET @i=@i+1;
END
