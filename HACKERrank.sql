
/* Q1.
Query the list of CITY names from STATION that either do not start with vowels 
OR
do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiou]' OR 
CITY NOT REGEXP '[aeiou]$';


/*
Query the Name of any student in STUDENTS who scored higher than 75 Marks.
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
secondary sort them by ascending ID.
*/
 -- SOL : 1

SELECT NAME 
FROM STUDENTS
WHERE MARKS > 75 
ORDER BY RIGHT(NAME,3) ,ID;

-- SOL:2
SELECT NAME 
FROM STUDENTS
WHERE MARKS > 75 
ORDER BY
SUBSTRING(NAME,-3,LENGTH(NAME)),ID;


/*
Write a query that prints a list of employee names 
(i.e.: the name attribute) from the Employee table in alphabetical order.

*/
SELECT NAME 
FROM EMPLOYEE
order by name asc;


/*
Write a query that prints a list of employee names (i.e.: the name attribute) 
for employees in Employee having a salary greater than  per month 
who have been employees for less than  months. Sort your result by ascending employee_id.

*/

SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID;


-----------------------------------------------
/* AGGREGATION */

/*
Query a count of the number of cities in CITY having a Population larger than 100,000
*/

SELECT COUNT(POPULATION)
FROM CITY 
WHERE POPULATION > 100000;

/*
Query the average population for all cities in CITY, 
rounded down to the nearest integer.
*/
SELECT FLOOR(AVG(POPULATION))
FROM CITY ;

/*
Query the sum of the populations for all Japanese cities in CITY. 
The COUNTRYCODE for Japan is JPN
*/
SELECT SUM(POPULATION)
FROM CITY 
WHERE COUNTRYCODE = 'JPN';

/*

ROUND(number, decimals) : Round the number to 2 decimal places
FLOOR(number) : Return the largest integer value that is less than or equal to 25.75:
	
					SELECT FLOOR(25.75); O/P: 25

CEIL(number) : Return the smallest integer value that is greater than or equal to 25.75:

					SELECT CEIL(25.75); O/P: 26
CEILING(number): Return the smallest integer value that is greater than or equal to 25.75; SIMILAR WITH CEIL()

TRUNCATE(number, decimals): Return a number truncated to 2 decimal places;
             
                  SELECT TRUNCATE(345.156, 0); O/P: 345
*/


/* Q1:
Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places.
*/

-- solution:
SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
FROM STATION;

/* Q2
Query the sum of Northern Latitudes (LAT_N) from STATION 
having values greater than 38.7880 and less than137.2345. 
Truncate your answer to 4  decimal places.

*/

SELECT TRUNCATE(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

/* Q3.
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
Truncate your answer to  decimal places.
*/

SELECT TRUNCATE(MAX(LAT_N),4)
FROM STATION
WHERE LAT_N < 137.2345;

/* Q4.
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) 
in STATION that is less than 137.2345. 
Round your answer to 4 decimal places.

*/
SELECT ROUND(LONG_W,4)
FROM STATION WHERE LAT_N =

        (SELECT (MAX(LAT_N))
        FROM STATION
        WHERE LAT_N < 137.2345) ;

/*
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N)
 in STATION is greater than 38.7780 . 
Round your answer to 4 decimal places.
*/
select round(long_w,4)
from station 
where lat_n = 
      (  select min(lat_n)
        from station
        where lat_n> 38.7780 );
        
        
/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

a > happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b > happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c > happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d > happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the >>. Manhattan Distance .<< between points P1 and P2 and round it to a scale of 4 decimal places

*/ 

/*
Enter your query here.
In a plane with p1 at (x1, y1) and p2 at (x2, y2),then
Manhattan Distance:
it is |x1 - x2| + |y1 - y2|

X = LAT_N ; Y = LONG_W
*/

select round(ABS(MIN(LAT_N)-MAX(LAT_N)) + ABS(MIN(LONG_W)- MAX(LONG_W)),4)
from station;    

   

