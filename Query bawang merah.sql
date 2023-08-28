--mencari produksi tertinggi bawang merah selama 5 tahun terakhir 


SELECT Province, ("2018" + "2019" + "2020" + "2021" + "2022") as TotalProduction
FROM Pertanian..bawang_merah
WHERE Province != 'Indonesia'
ORDER BY TotalProduction DESC;

--melihat produksi bawang merah tertinggi selama 5 tahun terakhir 

WITH MaxProduction AS(
SELECT  TOP 1 '2018' as Year, Province, "2018" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production DESC
UNION
SELECT TOP 1 '2019' as Year, Province,"2019" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production DESC
UNION 
SELECT TOP 1 '2020' as Year, Province,"2020" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production DESC
UNION
SELECT TOP 1 '2021' as Year, Province,"2021" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production DESC
UNION 
SELECT TOP 1 '2022' as Year, Province,"2022" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production DESC
)
SELECT * FROM MaxProduction 

--melihat produksi bawang merah  5 terendah  selama 5 tahun terakhir 

WITH MaxProduction AS(
SELECT  TOP 5 '2018' as Year, Province, "2018" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production ASC
UNION
SELECT TOP 5 '2019' as Year, Province,"2019" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production ASC
UNION 
SELECT TOP 5 '2020' as Year, Province,"2020" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production ASC
UNION
SELECT TOP 5 '2021' as Year, Province,"2021" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production ASC
UNION 
SELECT TOP 5 '2022' as Year, Province,"2022" AS production FROM Pertanian..bawang_merah WHERE Province != 'INDONESIA' ORDER BY production ASC
)
SELECT * FROM MaxProduction 


--see total product in every komoditi


WITH Production AS (
SELECT 'Bawawng Merah' AS Komoditi, SUM("2018" + "2019" + "2020" + "2021" + "2022") as Production from Pertanian..bawang_merah WHERE Province != 'INDONESIA'
UNION 
SELECT 'Bawawng Putih' AS Komoditi, SUM("2018" + "2019" + "2020" + "2021" + "2022") as Production from Pertanian..bawang_putih WHERE Province != 'INDONESIA'
UNION
SELECT 'Cabai Besar' AS Komoditi, SUM("2018" + "2019" + "2020" + "2021" + "2022") as Production from Pertanian..cabai_besar  WHERE Province != 'INDONESIA'
UNION 
SELECT 'Cabai Rawit' AS Komoditi, SUM("2018" + "2019" + "2020" + "2021" + "2022") as Production from Pertanian..cabai_rawit  WHERE Province != 'INDONESIA' 
)
SELECT * FROM Production ORDER BY Production DESC