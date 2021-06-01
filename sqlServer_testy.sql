-- Badanie wydajnoœci z³¹czeñ i zagnie¿d¿eñ dla schematów znormalizowanych i zdenormalizowanych 
-- Filip Giermek AGH 2021

-- 1.
set statistics time on
SELECT COUNT(*) FROM Milion INNER JOIN nonNormalized.GeoTabela ON 
(Milion.liczba % 68 = (nonNormalized.GeoTabela.id_pietro))
set statistics time off


-- 2.
set statistics time on
SELECT COUNT(*) FROM Milion INNER JOIN Normalized.GeoPietro ON 
(Milion.liczba % 68=Normalized.GeoPietro.id_pietro) JOIN Normalized.GeoEpoka ON Normalized.GeoPietro.id_epoka = Normalized.GeoEpoka.id_epoka JOIN 
Normalized.GeoOkres ON Normalized.GeoEpoka.id_okres=Normalized.GeoOkres.id_okres JOIN Normalized.GeoEra ON Normalized.GeoOkres.id_era = Normalized.GeoEra.id_era JOIN Normalized.GeoEon
ON Normalized.GeoEra.id_eon=Normalized.GeoEon.id_eon;
set statistics time off

-- 3.
set statistics time on
SELECT COUNT(*) FROM Milion WHERE Milion.liczba % 68= 
(SELECT id_pietro FROM nonNormalized.GeoTabela WHERE Milion.liczba % 68=id_pietro);set statistics time off-- 4.set statistics time onSELECT COUNT(*) FROM Milion WHERE Milion.liczba % 68=
(SELECT id_pietro FROM Normalized.GeoPietro JOIN Normalized.GeoEpoka ON Normalized.GeoPietro.id_epoka = Normalized.GeoEpoka.id_epoka JOIN 
Normalized.GeoOkres ON Normalized.GeoEpoka.id_okres=Normalized.GeoOkres.id_okres JOIN Normalized.GeoEra ON Normalized.GeoOkres.id_era = Normalized.GeoEra.id_era JOIN Normalized.GeoEon
ON Normalized.GeoEra.id_eon=Normalized.GeoEon.id_eon  WHERE Milion.liczba % 68=id_pietro);
set statistics time off-- tworzenie indeksów klastrowanych-- GeoPietroCREATE CLUSTERED INDEX IX_PIETROON Normalized.GeoPietro(id_pietro)CREATE NONCLUSTERED INDEX IX_PIETRO2ON Normalized.GeoPietro(nazwa_pietro)CREATE NONCLUSTERED INDEX IX_PIETRO3ON Normalized.GeoPietro(id_epoka)-- GeoOkresCREATE NONCLUSTERED INDEX IX_OKRES2ON Normalized.GeoOkres(nazwa_okres)CREATE NONCLUSTERED INDEX IX_OKRES3ON Normalized.GeoOkres(id_era)-- GeoEraCREATE NONCLUSTERED INDEX IX_ERA2ON Normalized.GeoEra(nazwa_era)CREATE NONCLUSTERED INDEX IX_ERA3ON Normalized.GeoEra(id_eon)-- GeoEpokaCREATE NONCLUSTERED INDEX IX_EPOKA2ON Normalized.GeoEpoka(nazwa_epoka)CREATE NONCLUSTERED INDEX IX_EPOKA3ON Normalized.GeoEpoka(id_okres)-- GeoEonCREATE NONCLUSTERED INDEX IX_EON2ON Normalized.GeoEon(nazwa_eon)-- GeoTabelaCREATE CLUSTERED INDEX IX_TABELAON nonNormalized.GeoTabela(id_pietro)CREATE NONCLUSTERED INDEX IX_TABELA2ON nonNormalized.GeoTabela(nazwa_pietro)CREATE NONCLUSTERED INDEX IX_TABELA3ON nonNormalized.GeoTabela(id_epoka)CREATE NONCLUSTERED INDEX IX_TABELA4ON nonNormalized.GeoTabela(nazwa_epoka)CREATE NONCLUSTERED INDEX IX_TABELA5ON nonNormalized.GeoTabela(id_okres)CREATE NONCLUSTERED INDEX IX_TABELA6ON nonNormalized.GeoTabela(nazwa_okres)CREATE NONCLUSTERED INDEX IX_TABELA7ON nonNormalized.GeoTabela(id_era)CREATE NONCLUSTERED INDEX IX_TABELA8ON nonNormalized.GeoTabela(nazwa_era)CREATE NONCLUSTERED INDEX IX_TABELA9ON nonNormalized.GeoTabela(id_eon)CREATE NONCLUSTERED INDEX IX_TABELA10ON nonNormalized.GeoTabela(nazwa_eon)-- MilionCREATE NONCLUSTERED INDEX IX_MILIONON Milion(liczba)