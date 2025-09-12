-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns
SELECT  
SUM(C.POPULATION) AS TOTAL_POPULATION
FROM CITY C
JOIN
COUNTRY T
ON C.CountryCode =T.Code
WHERE CONTINENT ='Asia';



-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT N.NAME
FROM CITY N
JOIN COUNTRY T
ON N.COUNTRYCODE = T.CODE
WHERE  CONTINENT ='Africa';
-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT C.Continent ,FLOOR(AVG(P.Population))
AS AVG_POPULATION
FROM COUNTRY C
JOIN CITY P
ON P.COUNTRYCODE= C.CODE
GROUP BY C.Continent;

-- Query a count of the number of cities in CITY having a Population larger than .
SELECT 
COUNT(DISTRICT)
FROM CITY
WHERE POPULATION >100000;


-- Query the total population of all cities in CITY where District is California.

SELECT 
SUM(POPULATION)
FROM CITY
WHERE DISTRICT ='California';

-- Query the average population of all cities in CITY where District is California.

SELECT 
AVG(POPULATION)
FROM CITY
WHERE DISTRICT ='California';




-- Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT
FLOOR(AVG(POPULATION))
FROM CITY;



-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.


SELECT 
SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE ='JPN';


-- Query the difference between the maximum and minimum populations in

SELECT 
MAX(POPULATION)-MIN(POPULATION)
FROM  CITY;