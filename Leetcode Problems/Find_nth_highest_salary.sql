/* Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
 

Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

The query result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+

*/

-- for 2nd highest it will work ; for others it will not work
select max(salary) as SecondHighestSalary
from employee where salary <
(select max(salary)
from employee);

-- general solution for this type of question
-- OFFSET means discard 
-- in 4th highest it should be offset 3 means

/*
5000
4000
3000
2000
1000

offset 3 means discard 3 :
2000
1000

limit 1 :
2000 ()output

*/
SELECT IFNULL((SELECT DISTINCT salary 
               FROM employee 
               ORDER BY SALARY DESC
               LIMIT 1 OFFSET 1 ), NULL) AS SecondHighestSalary;

-- SOLUTION 3
/*
input : 
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300  
  4  | 300 
  5  | 200
+----+--------+

output of dense_rank()
300 , 1
300 , 1
200 , 2
200 , 2
100 , 3

distinct:
300 , 1
200 , 2
100 , 3



*/
SELECT IFNULL((              
SELECT DISTINCT salary  
FROM (SELECT salary , dense_rank() 
      OVER (ORDER BY SALARY DESC )
      AS denserrank 
      FROM employee ) temp
WHERE temp. denserrank = 2) , NULL ) AS SecondHighestSalary;




