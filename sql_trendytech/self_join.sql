SELECT * FROM EMP;

INSERT INTO EMP(EMP_ID , EMP_NAME, SALARY, MANAGER_ID) VALUES (1,'Ankit',10000,4);
INSERT INTO EMP(EMP_ID , EMP_NAME, SALARY, MANAGER_ID) VALUES (2,'Mohit',15000,5);
INSERT INTO EMP(EMP_ID , EMP_NAME, SALARY, MANAGER_ID) VALUES (3,'Vikas',10000,4);
INSERT INTO EMP(EMP_ID , EMP_NAME, SALARY, MANAGER_ID) VALUES (4,'Rohit',5000,2);
INSERT INTO EMP(EMP_ID , EMP_NAME, SALARY, MANAGER_ID) VALUES (5,'Mudit',12000,6);
INSERT INTO EMP(EMP_ID , EMP_NAME, SALARY, MANAGER_ID) VALUES (6,'Agam',12000,2);
INSERT INTO EMP(EMP_ID , EMP_NAME, SALARY, MANAGER_ID) VALUES (7,'Sanjay',9000,2);
INSERT INTO EMP(EMP_ID , EMP_NAME, SALARY, MANAGER_ID) VALUES (8,'Asish',5000,2);

-- SELF JOIN

select e.emp_id, e.emp_name,m.emp_name as Manager, e.salary as engineer_salary , m.salary as manager_salary
from emp e 
inner join emp m 
on e.manager_id = m.emp_id
order by emp_id;


-- wrong output
select e.emp_id, 
e.emp_name,
e.salary,
m.salary as manager_salary
from emp e 
inner join emp m 
on e.manager_id = m.emp_id
where e.salary > m.salary;

