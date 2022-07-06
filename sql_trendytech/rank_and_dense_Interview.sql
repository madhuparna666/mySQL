-- disadvantages of row_number() :  It can't handle the duplicates ;
/*
in the below example you can see it ranked 3 and 4 for same salary 20000;
 that is ambigious
 
 So if I want to see the 3rd & 4th highest salary then both are = 20000 according to data
 
 solution : Rank() & dense_RANK() func
*/  
use customer;
SELECT firstname,lastname,salary,
row_number() OVER (ORDER BY salary DESC)
FROM employee;

-- IT WILL HANDLE THE DUPLICATES IN PROPER WAY
/*
example: when we have 20000 salary for 2 employee ; we got 
different rank using row_number() function ; but here for same salary it will assign same rank which is good .

but it will skip the next rank as the current rank is repeated.
like rank 3 is returned twice so, rank 4 is missing. This is AMBIGIOUS

ORDER BY IS MANDATORY WHILE USING RANK(), DENSE_RANK(), ROW_NUMBER() function
*/
SELECT firstname,lastname,salary,
RANK() OVER(ORDER BY salary DESC)
FROM EMPLOYEE;


/* dense_rank() funtion handles the duplicates 

example:1 for same salary 20k it returned same rank 3 . (row_number() funtion failed to do this)

2. it does not skip the rank numbers when we get duplicates (rank() func failed to do this)
*/
SELECT firstname,lastname,salary,
DENSE_RANK() OVER(ORDER BY salary DESC)
FROM EMPLOYEE;

/*
if there are no duplicates in the data then all the 3 functions return the same output
*/



