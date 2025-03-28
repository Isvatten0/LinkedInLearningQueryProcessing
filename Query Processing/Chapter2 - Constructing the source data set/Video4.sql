-------------------------------------
-- LinkedIn Learning ----------------
-- Advanced SQL - Query Processing --
-- Ami Levin 2020 -------------------
-- .\Chapter2\Video4.sql ------------
-------------------------------------
-- Luke's Solution to the following question. 
/*
Animal vaccinations report.
---------------------------
Write a query to report all animals and their vaccinations.
Animals that have not been vaccinated should be included.
The report should include the following attributes:
Animal's name, species, breed, and primary color,
vaccination time and the vaccine name,
the staff member's first name, last name, and role.

Guidelines:
-----------
Use the minimal number of tables required.
Use the correct logical join types and force join order as needed.
*/

SELECT A.Name, A.Species, A.Breed, A.Primary_Color, V.Vaccination_Time, V.Vaccine, P.First_Name, P.Last_Name, SA.Role
FROM Animals AS A
LEFT OUTER JOIN 
  (
  Vaccinations AS V
  INNER JOIN STAFF_ASSIGNMENTS AS SA
  ON S.Email = SA.EMAIL
  INNER JOIN PERSONS P
  ON S.Email = P.Email
  ) 
  ON A.Name = V.Name AND A.Species = V.Species
