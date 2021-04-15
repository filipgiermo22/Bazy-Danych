-- 1. utwórz tabele firma

USE firma;

-- 2. stwórz schemat ksiegowosc

CREATE SCHEMA ksiegowosc;

-- 3. stwórz tabele 

-- tabela danych osobowych pracownikow
CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika INT		PRIMARY KEY,
	imie VARCHAR(20)		NOT NULL,
	nazwisko VARCHAR(20)	NOT NULL,
	adres VARCHAR(120),
	telefon CHAR(9)			NOT NULL
);
-- tabela rejestru przepracowanych godzin
CREATE TABLE ksiegowosc.godziny (
	id_godziny INT		PRIMARY KEY,
	data DATE			NOT NULL,
	liczba_godzin INT	NOT NULL,
	id_pracownika INT	NOT NULL,
);

ALTER TABLE ksiegowosc.godziny 
	ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);

-- tabela informacji o premiach
CREATE TABLE ksiegowosc.premie (
	id_premii INT		PRIMARY KEY,
	rodzaj VARCHAR(25),
	kwota INT
);

-- tabela kwot pensji 
CREATE TABLE ksiegowosc.pensje (
	id_pensji INT			PRIMARY KEY,
	stanowisko VARCHAR(25),
	kwota INT				NOT NULL,
	id_premii INT
);

ALTER TABLE ksiegowosc.pensje
	ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);

-- tabela wynagrodzeñ ka¿dego pracownika
CREATE TABLE ksiegowosc.wynagrodzenie (
	id_wynagrodzenia INT	PRIMARY KEY,
	data DATE				NOT NULL,
	id_pracownika INT		NOT NULL,
	id_godziny INT			NOT NULL,
	id_pensji INT			NOT NULL,
	id_premii INT			NOT NULL
);

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);

ALTER TABLE ksiegowosc.wynagrodzenie
	ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);

-- 5 wype³nij tabele rekordami

INSERT INTO ksiegowosc.pracownicy VALUES
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

INSERT INTO ksiegowosc.godziny VALUES
	(1, '2021-03-22', 160, 1),
	(2, '2021-03-22', 163, 2),
	(3, '2021-03-21', 169, 3),
	(4, '2021-03-30', 170, 4),
	(5, '2021-03-31', 174, 5),
	(6, '2021-03-20', 173, 6),
	(7, '2021-03-24', 162, 7),
	(8, '2021-03-25', 160, 8),
	(9, '2021-03-30', 175, 9),
	(10, '2021-03-28', 182, 10);

INSERT INTO ksiegowosc.premie VALUES
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

INSERT INTO ksiegowosc.pensje VALUES
	(1, 'przedstawiciel handlowy', 4200, 1),
	(2, 'ksiêgowy', 4000, 2),
	(3, 'ksiêgowy', 4200, 3),
	(4, 'mened¿er', 5000, 4),
	(5, 'przedstawiciel handlowy', 4900, 5),
	(6, 'mened¿er', 5100,  6),
	(7, 'ksiêgowy', 4250, 7),
	(8, 'asystent', 3700, 8),
	(9, 'asystent' , 3750, 9),
	(10, 'mened¿er', 5200, 10);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
	(1, '2021-03-23', 1, 1, 1, 1),
	(2, '2021-03-24', 2, 2, 2, 2),
	(3, '2021-03-25', 3, 3, 3, 3),
	(4, '2021-03-23', 4, 4, 4, 4),
	(5, '2021-03-25', 5, 5, 5, 5),
	(6, '2021-03-30', 6, 6, 6, 6),
	(7, '2021-03-23', 7, 7, 7, 7),
	(8, '2021-03-27', 8, 8, 8, 8),
	(9, '2021-03-29', 9, 9, 9, 9),
	(10, '2021-03-31', 10, 10, 10, 10);

-- 6 polecenia

-- a)

SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--b)

SELECT id_pracownika
	FROM ksiegowosc.wynagrodzenie AS wynagrodzenie 
		JOIN ksiegowosc.pensje AS pensje
			ON wynagrodzenie.id_pensji = pensje.id_pensji 
	WHERE kwota > 4000;

--c)

SELECT id_pracownika 
	FROM ksiegowosc.wynagrodzenie AS wynagrodzenie
		JOIN ksiegowosc.pensje AS pensje 
			ON wynagrodzenie.id_pensji = pensje.id_pensji
		JOIN ksiegowosc.premie AS premie 
			ON wynagrodzenie.id_premii = premie.id_premii
	WHERE premie.kwota IS NULL AND pensje.kwota > 4000;

--d)

SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';

--e)

SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';

--f)

SELECT imie, nazwisko, liczba_godzin - 160 AS nadgodziny
	FROM ksiegowosc.pracownicy AS pracownicy 
		JOIN ksiegowosc.godziny AS godziny
			ON pracownicy.id_pracownika = godziny.id_pracownika
	WHERE godziny.liczba_godzin > 160;

--g)

SELECT imie, nazwisko 
	FROM ksiegowosc.pracownicy AS pracownicy
		JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie 
			ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
		JOIN ksiegowosc.pensje AS pensje 
			ON pensje.id_pensji = wynagrodzenie.id_pensji
	WHERE kwota > 4000 AND kwota < 5000;

--h)

SELECT imie, nazwisko 
	FROM ksiegowosc.pracownicy AS pracownicy
		JOIN ksiegowosc.godziny AS godziny 
			ON pracownicy.id_pracownika = godziny.id_pracownika
		JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie 
			ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
		JOIN ksiegowosc.premie AS prem 
			ON wynagrodzenie.id_premii = prem.id_premii
	WHERE godziny.liczba_godzin > 160 AND prem.kwota IS NULL;

--i)

SELECT imie, nazwisko, pensje.kwota 
	FROM ksiegowosc.pracownicy AS pracownicy
		JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie 
			ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
		JOIN ksiegowosc.pensje AS pensje 
			ON pensje.id_pensji = pracownicy.id_pracownika
	ORDER BY pensje.kwota;

--j)

SELECT imie, nazwisko, pensje.kwota AS pensja, premie.kwota AS premia 
	FROM ksiegowosc.pracownicy AS pracownicy
		JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie	
			ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
		JOIN ksiegowosc.premie AS premie 
			ON wynagrodzenie.id_premii = premie.id_premii
		JOIN ksiegowosc.pensje AS pensje 
			ON pensje.id_pensji = wynagrodzenie.id_pensji
	ORDER BY pensje.kwota DESC, premie.kwota DESC;

--k)

SELECT pensje.stanowisko, COUNT(*) 
	FROM ksiegowosc.pracownicy AS pracownicy
		JOIN ksiegowosc.wynagrodzenie AS wynagrodzenie 
			ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
		JOIN ksiegowosc.pensje AS pensje 
			ON pensje.id_pensji = wynagrodzenie.id_pensji
	GROUP BY pensje.stanowisko;

--l)

SELECT stanowisko, MIN(kwota) AS minimalna, MAX(kwota) AS maksymalna, AVG(kwota) AS œrednia 
	FROM ksiegowosc.pensje 
	GROUP BY stanowisko 
	HAVING stanowisko = 'asystent';

--m)

SELECT SUM(kwota) AS suma_pensji FROM ksiegowosc.pensje;

--n)

SELECT stanowisko, SUM(kwota) AS suma_pensji FROM ksiegowosc.pensje GROUP BY stanowisko;

--o)

SELECT stanowisko, COUNT(premie.kwota) AS liczba_premii
	FROM ksiegowosc.pensje AS pensje 
		JOIN ksiegowosc.premie AS premie 
			ON pensje.id_premii = premie.id_premii
	GROUP BY stanowisko;

--p)


