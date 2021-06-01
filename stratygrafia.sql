-- Badanie wydajnoœci z³¹czeñ i zagnie¿d¿eñ dla schematów znormalizowanych i zdenormalizowanych 
-- Filip Giermek AGH 2021

-- Stworzenie bazy danych
CREATE DATABASE stratygrafia;

-- Stworzenie schematu i tabeli zdenormalizowanej
CREATE SCHEMA nonNormalized;

CREATE TABLE nonNormalized.GeoTabela (
	id_pietro INT		  PRIMARY KEY,
	nazwa_pietro VARCHAR(20) NOT NULL,
	id_epoka INT			 NOT NULL,
	nazwa_epoka VARCHAR(20)  NOT NULL,
	id_okres INT			 NOT NULL,
	nazwa_okres VARCHAR(20)  NOT NULL,
	id_era INT				 NOT NULL,
	nazwa_era VARCHAR(20)    NOT NULL,
	id_eon INT				 NOT NULL,
	nazwa_eon VARCHAR(20)    NOT NULL
	);

INSERT INTO nonNormalized.GeoTabela VALUES
(1, 'lochkow', 1, 'Dolny', 1, 'Dewon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(2, 'prag', 1, 'Dolny', 1, 'Dewon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(3, 'ems', 1, 'Dolny', 1, 'Dewon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(4, 'eifel', 2, 'Œrodkowy', 1, 'Dewon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(5, 'zywet', 2, 'Œrodkowy', 1, 'Dewon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(6, 'fran', 3, 'Górny', 1, 'Dewon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(7, 'famen', 3, 'Górny', 1, 'Dewon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(8, 'turnej', 4, 'Dolny', 2, 'Karbon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(9, 'wizen', 4, 'Dolny', 2, 'Karbon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(10, 'serpuchow', 4, 'Dolny', 2, 'Karbon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(11, 'baszkir', 5, 'Górny', 2, 'Karbon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(12, 'moskow', 5, 'Górny', 2, 'Karbon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(13, 'kasimow', 5, 'Górny', 2, 'Karbon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(14, 'gzel', 5, 'Górny', 2, 'Karbon', 1, 'Paleozoik', 1, 'Fanerozoik'),
(15, 'assel', 6, 'Dolny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(16, 'sakmar', 6, 'Dolny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(17, 'artinsk', 6, 'Dolny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(18, 'kungur', 6, 'Dolny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(19, 'road', 6, 'Dolny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(20, 'word', 6, 'Dolny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(21, 'kapitan', 6, 'Dolny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(22, 'wucziaping', 7, 'Górny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(23, 'czangsing', 7, 'Górny', 3, 'Perm', 1, 'Paleozoik', 1, 'Fanerozoik'),
(24, 'ind', 8, 'Dolna', 4, 'Trias', 2, 'Mezozoik', 1, 'Fanerozoik'),
(25, 'olenek', 8, 'Dolna', 4, 'Trias', 2, 'Mezozoik', 1, 'Fanerozoik'),
(26, 'anizyk', 9, 'Œrodkowa', 4, 'Trias', 2, 'Mezozoik', 1, 'Fanerozoik'),
(27, 'ladyn', 9, 'Œrodkowa', 4, 'Trias', 2, 'Mezozoik', 1, 'Fanerozoik'),
(28, 'karnik', 10, 'Górna', 4, 'Trias', 2, 'Mezozoik', 1, 'Fanerozoik'),
(29, 'noryk', 10, 'Górna', 4, 'Trias', 2, 'Mezozoik', 1, 'Fanerozoik'),
(30, 'retyk', 10, 'Górna', 4, 'Trias', 2, 'Mezozoik', 1, 'Fanerozoik'),
(31, 'hettang', 11, 'Dolna', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(32, 'synemur', 11, 'Dolna', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(33, 'pliensbach', 11, 'Dolna', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(34, 'toark', 11, 'Dolna', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(35, 'aalen', 12, 'Œrodkowa', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(36, 'bajos', 12, 'Œrodkowa', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(37, 'baton', 12, 'Œrodkowa', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(38, 'kelowej', 12, 'Œrodkowa', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(39, 'oksford', 13, 'Górna', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(40, 'kimeryd', 13, 'Górna', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(41, 'tyton', 13, 'Górna', 5, 'Jura', 2, 'Mezozoik', 1, 'Fanerozoik'),
(42, 'berrias', 14, 'Dolna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(43, 'walanzyn', 14, 'Dolna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(44, 'hoteryw', 14, 'Dolna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(45, 'barrem', 14, 'Dolna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(46, 'apt', 14, 'Dolna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(47, 'alb', 14, 'Dolna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(48, 'cenoman', 15, 'Górna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(49, 'turon', 15, 'Górna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(50, 'koniak', 15, 'Górna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(51, 'santon', 15, 'Górna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(52, 'kampan', 15, 'Górna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(53, 'mastrycht', 15, 'Górna', 6, 'Kreda', 2, 'Mezozoik', 1, 'Fanerozoik'),
(54, 'dan', 16, 'Paleocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(55, 'zeland', 16, 'Paleocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(56, 'tanet', 16, 'Paleocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(57, 'iprez', 17, 'Eocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(58, 'lutet', 17, 'Eocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(59, 'barton', 17, 'Eocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(60, 'priabon', 17, 'Eocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(61, 'rupel', 18, 'Oligocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(62, 'szat', 18, 'Oligocen', 7, 'Paleogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(63, 'akwitan', 19, 'Miocen', 8, 'Neogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(64, 'burdygal', 19, 'Miocen', 8, 'Neogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(65, 'lang', 19, 'Miocen', 8, 'Neogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(66, 'serrawal', 19, 'Miocen', 8, 'Neogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(67, 'torton', 19, 'Miocen', 8, 'Neogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(68, 'messyn', 19, 'Miocen', 8, 'Neogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(69, 'zankl', 20, 'Pliocen', 8, 'Neogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(70, 'piacent', 20, 'Pliocen', 8, 'Neogen', 3, 'Kenozoik', 1, 'Fanerozoik'),
(71, 'gelas', 21, 'Plejstocen', 9, 'Czwartorzed', 3, 'Kenozoik', 1, 'Fanerozoik'),
(72, 'kalabr', 21, 'Plejstocen', 9, 'Czwartorzed', 3, 'Kenozoik', 1, 'Fanerozoik'),
(73, 'chiban', 21, 'Plejstocen', 9, 'Czwartorzed', 3, 'Kenozoik', 1, 'Fanerozoik'),
(74, 'pozny', 21, 'Plejstocen', 9, 'Czwartorzed', 3, 'Kenozoik', 1, 'Fanerozoik'),
(75, 'grenland', 22, 'Holocen', 9, 'Czwartorzed', 3, 'Kenozoik', 1, 'Fanerozoik'),
(76, 'northgrip', 22, 'Holocen', 9, 'Czwartorzed', 3, 'Kenozoik', 1, 'Fanerozoik'),
(77, 'megalaj', 22, 'Holocen', 9, 'Czwartorzed', 3, 'Kenozoik', 1, 'Fanerozoik');

-- Stworzenie schematu i tabel znormalizowanych
CREATE SCHEMA Normalized;

CREATE TABLE Normalized.GeoPietro (
	id_pietro INT PRIMARY KEY,
	nazwa_pietro VARCHAR(20),
	id_epoka INT FOREIGN KEY REFERENCES Normalized.GeoEpoka(id_epoka)
);

INSERT INTO Normalized.GeoPietro VALUES
(1, 'lochkow', 1),
(2, 'prag', 1),
(3, 'ems', 1),
(4, 'eifel', 2),
(5, 'zywet', 2),
(6, 'fran', 3),
(7, 'famen', 3),
(8, 'turnej', 4),
(9, 'wizen', 4),
(10, 'serpuchow', 4),
(11, 'baszkir', 5),
(12, 'moskow', 5),
(13, 'kasimow', 5),
(14, 'gzel', 5),
(15, 'assel', 6),
(16, 'sakmar', 6),
(17, 'artinsk', 6),
(18, 'kungur', 6),
(19, 'road', 6),
(20, 'word', 6),
(21, 'kapitan', 6),
(22, 'wucziaping', 7),
(23, 'czangsing', 7),
(24, 'ind', 8),
(25, 'olenek', 8),
(26, 'anizyk', 9),
(27, 'ladyn', 9),
(28, 'karnik', 10),
(29, 'noryk', 10),
(30, 'retyk', 10),
(31, 'hettang', 11),
(32, 'synemur', 11),
(33, 'pliensbach', 11),
(34, 'toark', 11),
(35, 'aalen', 12),
(36, 'bajos', 12),
(37, 'baton', 12),
(38, 'kelowej', 12),
(39, 'oksford', 13),
(40, 'kimeryd', 13),
(41, 'tyton', 13),
(42, 'berrias', 14),
(43, 'walanzyn', 14),
(44, 'hoteryw', 14),
(45, 'barrem', 14),
(46, 'apt', 14),
(47, 'alb', 14),
(48, 'cenoman', 15),
(49, 'turon', 15),
(50, 'koniak', 15),
(51, 'santon', 15),
(52, 'kampan', 15),
(53, 'mastrycht', 15),
(54, 'dan', 16),
(55, 'zeland', 16),
(56, 'tanet', 16),
(57, 'iprez', 17),
(58, 'lutet', 17),
(59, 'barton', 17),
(60, 'priabon', 17),
(61, 'rupel', 18),
(62, 'szat', 18),
(63, 'akwitan', 19),
(64, 'burdygal', 19),
(65, 'lang', 19),
(66, 'serrawal', 19),
(67, 'torton', 19),
(68, 'messyn', 19),
(69, 'zankl', 20),
(70, 'piacent', 20),
(71, 'gelas', 21),
(72, 'kalabr', 21),
(73, 'chiban', 21),
(74, 'pozny', 21),
(75, 'grenland', 22),
(76, 'northgrip', 22),
(77, 'megalaj', 22);


CREATE TABLE Normalized.GeoEpoka (
	id_epoka INT PRIMARY KEY,
	nazwa_epoka VARCHAR(20),
	id_okres INT FOREIGN KEY REFERENCES Normalized.GeoOkres(id_okres)
);

INSERT INTO Normalized.GeoEpoka VALUES
(1, 'Dolny', 1),
(2, 'Œrodkowy', 1),
(3, 'Górny', 1),
(4, 'Dolny', 2),
(5, 'Górny', 2),
(6, 'Dolny', 3),
(7, 'Górny', 3),
(8, 'Dolna', 4),
(9, 'Œrodkowa', 4),
(10, 'Górna', 4),
(11, 'Dolna', 5),
(12, 'Œrodkowa', 5),
(13, 'Górna', 5),
(14, 'Dolna', 6),
(15, 'Górna', 6),
(16, 'Paleocen', 7),
(17, 'Eocen', 7),
(18, 'Oligocen', 7),
(19, 'Miocen', 8),
(20, 'Pliocen', 8),
(21, 'Plejstocen', 9),
(22, 'Holocen', 9);


CREATE TABLE Normalized.GeoOkres (
	id_okres INT PRIMARY KEY,
	nazwa_okres VARCHAR(20),
	id_era INT FOREIGN KEY REFERENCES Normalized.GeoEra(id_era)
);

INSERT INTO Normalized.GeoOkres VALUES
(1, 'Dewon', 1),
(2, 'Karbon', 1),
(3, 'Perm', 1),
(4, 'Trias', 2),
(5, 'Jura', 2),
(6, 'Kreda', 2),
(7, 'Paleogen', 3),
(8, 'Neogen', 3),
(9, 'Czwartorzed', 3);


CREATE TABLE Normalized.GeoEra (
	id_era INT PRIMARY KEY,
	nazwa_era VARCHAR(20),
	id_eon INT FOREIGN KEY REFERENCES Normalized.GeoEon(id_eon)
);

INSERT INTO Normalized.GeoEra VALUES
(1, 'Paleozoik', 1),
(2, 'Mezozoik', 1),
(3, 'Kenozoik', 1);


CREATE TABLE Normalized.GeoEon (
	id_eon INT PRIMARY KEY,
	nazwa_eon VARCHAR(20),
);

INSERT INTO Normalized.GeoEon VALUES
(1, 'Fanerozoik');

-- Stworzenie tabeli Milion 
CREATE TABLE Dziesiec(cyfra int, bit int);
INSERT INTO Dziesiec VALUES 
(0,0),
(1,1),
(2,1),
(3,0),
(4,1),
(5,0),
(6,1),
(7,0),
(8,0),
(9,1);

CREATE TABLE Milion(liczba int,cyfra int, bit int);

INSERT INTO Milion 
	SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra 
		   + 10000*a5.cyfra + 100000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit 
	FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;