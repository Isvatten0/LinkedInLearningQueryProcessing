-------------------------------------
-- LinkedIn Learning ----------------
-- Advanced SQL - Query Processing --
-- Ami Levin 2020 -------------------
-- .\Chapter4\Video4.sql ------------
-------------------------------------

/*
Animal vaccination report
--------------------------

Write a query to report the number of vaccinations each animal has received.
Include animals that were never vaccinated.
Exclude all rabbits.
Exclude all Rabies vaccinations.
Exclude all animals that were last vaccinated on or after October first, 2019.

The report should return the following attributes:
Animals Name, Species, Primary Color, Breed,
and the number of vaccinations this animal has received,

-- Guidelines
Use the correct logical join types and force order if needed.
Use the  correct logical group by expressions.
*/
--Lukes Answer Below:

SELECT A.Species, A.Name, MAX(A.Primary_Color) as Primary_Color, MAX(A.Breed) as Breed, Count(V.Vaccine) AS Count
FROM Animals AS A
LEFT OUTER JOIN Vaccinations AS V
ON A.Name = V.Name AND A.Species = V.Species
WHERE A.Species != 'Rabbit' AND (V.Vaccine != 'Rabies' OR V.Vaccine IS NULL)
GROUP BY A.Species, A.Name
HAVING  MAX(V.Vaccination_Time) < '20191001' OR MAX(V.Vaccination_Time) IS NULL
