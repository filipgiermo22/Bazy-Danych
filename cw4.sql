-- 1. Tworzenie bazy

 CREATE DATABASE firma;

-- 2. Tworzenie schematu

CREATE SCHEMA rozliczenia;

-- 3. Tworzenie tabeli

CREATE TABLE rozliczenia.pracownicy (
	id_pracownika INT		PRIMARY KEY,
	imie VARCHAR(20)		NOT NULL,
	nazwisko VARCHAR(20)	NOT NULL,
	adres VARCHAR(120),
	telefon CHAR(9)			NOT NULL
);

CREATE TABLE rozliczenia.godziny (
	id_godziny INT		PRIMARY KEY,
	data DATE			NOT NULL,
	liczba_godzin INT	NOT NULL,
	id_pracownika INT	NOT NULL,
);

-- ustalenie klucza obcego

ALTER TABLE rozliczenia.godziny 
	ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika)


CREATE TABLE rozliczenia.premie (
	id_premii INT		PRIMARY KEY,
	rodzaj VARCHAR(25),
	kwota INT
);

CREATE TABLE rozliczenia.pensje (
	id_pensji INT			PRIMARY KEY,
	stanowisko VARCHAR(25),
	kwota INT				NOT NULL,
	id_premii INT
);

-- ustalenie klucza obcego

ALTER TABLE rozliczenia.pensje
	ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii)

-- 4. Dodanie rekordów

INSERT INTO rozliczenia.pracownicy VALUES
	(1, 'Jan', 'Kowalski', NULL ,'294829482'),
	(2, 'Maciej', 'Liskowski', 'Czerwieñska 31/3', '489489209'),
	(3, 'Paulina', 'Malinowska', 'D³uga 15', '48395093'),
	(4, 'Wiktor', 'Kaczmarek', NULL, '394819304'),
	(5, 'Wiktor', 'Adamski', 'Z³ota 43f', '394820195'),
	(6, 'Weronika', 'Kowalczyk', 'Widokowa 2/3', '384910684'),
	(7, 'Micha³', 'Jasieñski', NULL, '493829104'),
	(8, 'Karol', 'D¹browski', NULL, '492849204'),
	(9, 'Marcin', 'Zakrzewski', 'Mi³a 23/4', '485920385'),
	(10, 'Mateusz', 'Krawczyk', NULL, '485729386');

INSERT INTO rozliczenia.godziny VALUES
	(1, '2021-03-22', 120, 1),
	(2, '2021-03-22', 118, 2),
	(3, '2021-03-21', 108, 3),
	(4, '2021-03-30', 134, 4),
	(5, '2021-03-31', 131, 5),
	(6, '2021-03-20', 129, 6),
	(7, '2021-03-24', 152, 7),
	(8, '2021-03-25', 154, 8),
	(9, '2021-03-30', 120, 9),
	(10, '2021-03-28', 130, 10);

INSERT INTO rozliczenia.premie VALUES
	(1, 'zadaniowa', 150),
	(2, 'motywacyjna', 85),
	(3, 'zadaniowa', 125),
	(4, 'zadaniowa', 100),
	(5, NULL, NULL),
	(6, 'motywacyjna', 80),
	(7, NULL, NULL),
	(8, NULL, NULL),
	(9, NULL, NULL),
	(10, 'motywacyjna', 80);

INSERT INTO rozliczenia.pensje VALUES
	(1, 'przedstawiciel handlowy', 4200, 1),
	(2, 'ksiêgowy', 4000, 2),
	(3, 'ksiêgowy', 4200, 3),
	(4, 'menad¿er', 5000, 4),
	(5, 'przedstawiciel handlowy', 4900, 5),
	(6, 'mened¿er', 5100,  6),
	(7, 'ksiêgowy', 4250, 7),
	(8, 'asystent', 3700, 8),
	(9, 'asystent' , 3750, 9),
	(10, 'mened¿er', 5200, 10);

-- 5. Wyœwietlenie nazwisk z adresami

SELECT nazwisko, adres FROM rozliczenia.pracownicy

-- 6. Dodanie do tabeli dnia tygodnia i miesiaca pobranych z daty

SELECT *, DATEPART(weekday, data) AS "Dzien_tyg", DATEPART(month, data) AS "miesiac" FROM rozliczenia.godziny

-- 7. Zmiana nazwy kolumny 'kwota' -> 'kwota_brutto' i stworzenie i obliczenie kolumny 'kwota_netto'

EXEC sp_RENAME 'rozliczenia.pensje.kwota' , 'kwota_brutto', 'COLUMN'

ALTER TABLE rozliczenia.pensje ADD kwota_netto INT

UPDATE rozliczenia.pensje SET kwota_netto = kwota_brutto*0.81

-- Wyœwietlenie po dodaniu kolumny

SELECT * FROM rozliczenia.premie