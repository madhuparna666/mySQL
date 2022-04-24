use customer;

CREATE TABLE employee(
firstname varchar(20),
lastname varchar(20),
age int,
salary int,
location varchar(20)
);

drop table employee;
INSERT INTO employee VALUES('Sachin', 'Sharma' , 28, 10000, 'Bangalore');

INSERT INTO employee VALUES('Shane', 'Warne' , 30, 20000, 'Bangalore');

INSERT INTO employee VALUES('Rohit', 'Sharma' , 32, 30000, 'Hyderabad');

INSERT INTO employee VALUES('Shikhar', 'Dhawan' , 32, 25000, 'Hyderabad');

INSERT INTO employee VALUES('Rahul', 'Dravid' , 31, 20000, 'Bangalore');

INSERT INTO employee VALUES('Saurabh', 'Ganguly' , 32, 15000, 'Pune');

INSERT INTO employee VALUES('Kapil', 'Dev' , 34, 10000, 'Pune');


select * from employee;

/* 
Q1. how many people from each location and avg salary at each location
*/

SELECT location, COUNT(location) AS Total , AVG(SALARY) AS Avg_Salary
FROM employee
GROUP BY location;

-- Ex:1
SELECT FIRSTNAME, LASTNAME, employee.LOCATION , Total, avg_salary
from employee
JOIN 
(SELECT location, COUNT(location) AS Total , AVG(SALARY) AS Avg_Salary
FROM employee
GROUP BY location) temp_table
ON employee.location = temp_table.location;

-- alternative of implementing ex:1
-- Use OVER PARTITION BY to achieve above result easily

SELECT firstname,lastname,location,
COUNT(location) OVER(PARTITION BY location) AS Total,
AVG(salary) OVER (PARTITION BY location) AS Avg_salary
FROM employee;

-- pros of using 'Over' & 'partition by' clause 
/*
1 . We are able to combine non-aggregated columns(firstname, lastname , location)
with aggregated column[ count(location) ] in a single part.

Otherwise we can't do it with 'GROUP BY' CLAUSE IN  1 query
. we have to use sub-query

 */