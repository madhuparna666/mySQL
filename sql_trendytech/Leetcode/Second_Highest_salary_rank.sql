# Write your MySQL query statement below

/*select max(salary) as SecondHighestSalary
from employee where salary <
(select max(salary)
from employee);


SELECT salary as SecondHighestSalary
FROM Employee
ORDER BY SALARY 
LIMIT 1
OFFSET 1;
*/

/* solution 2
SELECT IFNULL((SELECT DISTINCT salary 
               FROM employee 
               ORDER BY SALARY DESC
               LIMIT 1 OFFSET 1 ), NULL) AS SecondHighestSalary
  */             
               
SELECT IFNULL((              
SELECT DISTINCT salary  
FROM (SELECT salary , dense_rank() 
      OVER (ORDER BY SALARY DESC )
      AS denserrank 
      FROM employee ) temp
WHERE temp. denserrank = 2) , NULL ) AS SecondHighestSalary;
  