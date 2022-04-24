use customer;

select * from employee;

-- row_number() important for interview
-- 1 . Sorting the salary then giving row number

/* The ROW_NUMBER() function in MySQL 
is used to returns the sequential number for each row within its partition. 
It is a kind of window function. 
The row number starts from 1 to the number of rows present in the partition.*/


-- disadvantages of row_number() :  It can't handle the duplicates ;
/*
in the below example you can see it ranked 3 and 4 for same salary 20000;
 that is ambigious
 
 So if I want to see the 3rd & 4th highest salary then both are = 20000
 
 solution : Rank & dense func
*/  

-- We must use 'order by' while using row_number() function;
-- Otherwise it will not work
SELECT firstname,lastname,salary,
row_number() OVER (ORDER BY salary DESC)
FROM employee;


-- Q2. RETURN THE 5TH HIGHEST SALARY

SELECT * 
FROM 
	(SELECT FIRSTNAME, LASTNAME, SALARY,
	row_number() OVER (ORDER BY SALARY DESC) AS ROWNUM
	FROM EMPLOYEE ) tempTable 
WHERE ROWNUM = 5;

-- Q3. I want to assign row numbers for partitions based on each location

SELECT FIRSTNAME , LASTNAME , LOCATION, SALARY,
ROW_NUMBER() OVER (partition by LOCATION ORDER BY SALARY DESC) 
FROM EMPLOYEE;

-- Q4. I want to find the employees who have highest salary of each location

SELECT * FROM
	(SELECT FIRSTNAME, LASTNAME, LOCATION , SALARY,
	ROW_NUMBER() OVER(partition by LOCATION ORDER BY SALARY DESC) AS ROWNUM
	FROM EMPLOYEE) Table1
 where ROWNUM = 1;   






