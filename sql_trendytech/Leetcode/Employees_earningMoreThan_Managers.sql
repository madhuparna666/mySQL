# Write your MySQL query statement below

# self join 

SELECT e1.NAME AS Employee
FROM Employee e1
join Employee e2 
ON e1.managerId = e2.id AND e1.salary > e2.salary;


/* without join */

select e.Name as Employee 
from Employee e, Employee m 
where e.ManagerId = m.Id and e.Salary > m.Salary;