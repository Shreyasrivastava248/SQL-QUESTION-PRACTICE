-- Query the distinct city names from the STATION table where both the first and last characters are not vowels

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY,1,1)) NOT  IN ('a','e','i','o','u')
AND LOWER(SUBSTR(CITY,LENGTH(CITY),1)) NOT  IN ('a','e','i','o','u');