select * from STUDENTS;
show databases;
use customer;

SELECT source_of_joining, count(*) as total
FROM STUDENTS
group by source_of_joining;

-- below code will through error
-- why ?
-- The where clause is used BEFORE group BY; but here I used after 'group by'
-- it means where clause is good to filter individual records before aggregation(here:group by)
-- Solution : USe 'Having' clause
SELECT source_of_joining, count(*) as total
FROM STUDENTS
group by source_of_joining where total < 8;

-- Having clause is used to filter the aggregated data
SELECT source_of_joining, count(*) as total
FROM STUDENTS
group by source_of_joining having total < 8;

-- Q1. I want to know the count of people joined through linkedin
SELECT source_of_joining, COUNT(*) AS TOTAL
FROM students
GROUP BY source_of_joining 
HAVING source_of_joining = 'LINKEDIN';

-- will through error cause we are filtering the aggregated data using 'where'
SELECT source_of_joining, COUNT(*) AS TOTAL
FROM students
GROUP BY source_of_joining 
WHERE source_of_joining = 'LINKEDIN';

-- OPTIMIZED WAY{of Q1}(here we are using 'where' to Filter but before aggregation , So it will work)
SELECT source_of_joining, COUNT(*) AS TOTAL
FROM students
WHERE source_of_joining = 'LINKEDIN'
GROUP BY source_of_joining ;

-- Q2. Can we use 'where' and 'having' clause in one query?
-- ans: YES
-- How? 
-- 'where' clause is used to filter the data before group by

-- I want to see the locations from which more than 1 student has joined 
-- and the student experience is more than 70 yrs

select location, count(*) as total
from students
where years_of_exp > 10
group by location
having total > 1;

-- * Points to remember *
/*

1. 'where' is used before group by and do filtering on individual records
2. 'Having' is used after group by and do filtering on aggregated records
3.  We can use 'where' clause and 'having'clause in same query
4.  'where' is more performant than 'having'

*/

