-- Query the distinct city names from the STATION table where either the first character or the last character is not a vowel

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) NOT IN ('a','e','i','o','u')
  OR LOWER(SUBSTR(CITY, LENGTH(CITY), 1)) NOT IN ('a','e','i','o','u');

