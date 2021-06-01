-- Badanie wydajności złączeń i zagnieżdżeń dla schematów znormalizowanych i zdenormalizowanych 
-- Filip Giermek AGH 2021

-- 1.
SELECT COUNT(*) FROM Milion INNER JOIN nonNormalized.GeoTabela ON 
(Milion.liczba % 68 = (nonNormalized.GeoTabela.id_pietro));


-- 2.
SELECT COUNT(*) FROM Milion INNER JOIN Normalized.GeoPietro ON 
(mod(Milion.liczba,68)=Normalized.GeoPietro.id_pietro) NATURAL JOIN Normalized.GeoEpoka NATURAL JOIN 
Normalized.GeoOkres NATURAL JOIN Normalized.GeoEra NATURAL JOIN Normalized.GeoEon;

-- 3.
SELECT COUNT(*) FROM Milion WHERE Milion.liczba % 68= 
(SELECT id_pietro FROM nonNormalized.GeoTabela WHERE Milion.liczba % 68=id_pietro);


-- 4.
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)=
(SELECT Normalized.GeoPietro.id_pietro FROM Normalized.GeoPietro NATURAL JOIN Normalized.GeoEpoka NATURAL JOIN 
Normalized.GeoOkres NATURAL JOIN Normalized.GeoEra NATURAL JOIN Normalized.GeoEon WHERE Milion.liczba % 68=id_pietro);

-- tworzenie indeksów klastrowanych
-- GeoPietro

CREATE INDEX IX_PIETRO
ON Normalized.GeoPietro(id_pietro);

CREATE INDEX IX_PIETRO2
ON Normalized.GeoPietro(nazwa_pietro);

CREATE INDEX IX_PIETRO3
ON Normalized.GeoPietro(id_epoka);

-- GeoOkres

CREATE INDEX IX_OKRES2
ON Normalized.GeoOkres(nazwa_okres);

CREATE INDEX IX_OKRES3
ON Normalized.GeoOkres(id_era);

-- GeoEra

CREATE INDEX IX_ERA2
ON Normalized.GeoEra(nazwa_era);

CREATE INDEX IX_ERA3
ON Normalized.GeoEra(id_eon);

-- GeoEpoka

CREATE INDEX IX_EPOKA2
ON Normalized.GeoEpoka(nazwa_epoka);

CREATE INDEX IX_EPOKA3
ON Normalized.GeoEpoka(id_okres);

-- GeoEon

CREATE INDEX IX_EON2
ON Normalized.GeoEon(nazwa_eon);

-- GeoTabela

CREATE INDEX IX_TABELA
ON nonNormalized.GeoTabela(id_pietro);

CREATE INDEX IX_TABELA2
ON nonNormalized.GeoTabela(nazwa_pietro);

CREATE INDEX IX_TABELA3
ON nonNormalized.GeoTabela(id_epoka);

CREATE INDEX IX_TABELA4
ON nonNormalized.GeoTabela(nazwa_epoka);

CREATE INDEX IX_TABELA5
ON nonNormalized.GeoTabela(id_okres);

CREATE INDEX IX_TABELA6
ON nonNormalized.GeoTabela(nazwa_okres);

CREATE INDEX IX_TABELA7
ON nonNormalized.GeoTabela(id_era);

CREATE INDEX IX_TABELA8
ON nonNormalized.GeoTabela(nazwa_era);

CREATE INDEX IX_TABELA9
ON nonNormalized.GeoTabela(id_eon);

CREATE INDEX IX_TABELA10
ON nonNormalized.GeoTabela(nazwa_eon);

-- Milion

CREATE INDEX IX_MILION
ON Milion(liczba);