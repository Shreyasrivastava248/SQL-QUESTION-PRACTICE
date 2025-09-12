SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) IN ('a', 'e', 'i', 'o', 'u')
  AND LOWER(SUBSTR(CITY, LENGTH(CITY), 1)) IN ('a', 'e', 'i', 'o', 'u');

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.
SELECT
TRUNC(SUM(LAT_N),4)
FROM STATION
WHERE
LAT_N > 38.7880 AND LAT_N < 137.2345;




-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.

SELECT
TRUNC(MAX(LAT_N),4)
FROM STATION
WHERE
LAT_N < 137.2345;



-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.
SELECT ROUND(LONG_W,4)
FROM STATION
WHERE
LAT_N=(
SELECT MAX(LAT_N)
FROM STATION
    WHERE LAT_N <137.2345
);




-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.
SELECT 
ROUND(MIN(LAT_N),4)
FROM STATION
WHERE LAT_N >38.7780;



-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.
SELECT 
ROUND(LONG_W,4)
FROM STATION
WHERE
LAT_N=(
SELECT
    MIN(LAT_N)
    FROM STATION
    WHERE LAT_N >38.7780
);



-- Consider P1(A,B) and P2(C,D) to be two points on a 2D plane.

-- A happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-- B happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-- C happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-- D happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points P1 and P2 and round it to a scale of  4 decimal places.

SELECT 
ROUND((MAX(LAT_N)-MIN(LAT_N)) + (MAX(LONG_W)-MIN(LONG_W)),4)
FROM STATION;



-- Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

-- Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

-- Input Format

-- The STATION table is described as follows:

SELECT
ROUND(
SQRT(
    POWER(MAX(LAT_N)-MIN(LAT_N),2)+
    POWER(MAX(LONG_W)- MIN(LONG_W),2)
    ),4
)AS Euclidean_Distance
FROM STATION;



-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
-- 
-- Input Format

SELECT
  ROUND(
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY LAT_N),
    4
  ) AS median_lat
FROM STATION;



-- Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

-- Write a query to help Eve.



SELECT
  CASE 
    WHEN g.Grade >= 8 THEN s.Name 
    ELSE 'NULL' 
  END AS Name,
  g.Grade,
  s.Marks
FROM Students s
JOIN Grades g
  ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY
  g.Grade DESC,
  CASE 
    WHEN g.Grade >= 8 THEN s.Name 
    ELSE NULL 
  END ASC,
  CASE 
    WHEN g.Grade < 8 THEN s.Marks 
    ELSE NULL 
  END ASC;