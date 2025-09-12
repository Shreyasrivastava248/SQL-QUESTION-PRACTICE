-- Query the distinct city names from the STATION table that do not end with a vowel
SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY,LENGTH(CITY),1) NOT IN ('a','e','i','o','u');
