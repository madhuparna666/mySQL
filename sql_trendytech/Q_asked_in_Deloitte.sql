use customer;
drop table emp_2020;
create table emp_2020(emp_id INT , Designation varchar(30));
create table emp_2021(emp_id INT , Designation varchar(30));

INSERT INTO emp_2020(emp_id ,Designation ) VALUES (1, 'Trainee');
INSERT INTO emp_2020(emp_id ,Designation ) VALUES (2, 'Developer');
INSERT INTO emp_2020(emp_id ,Designation ) VALUES (3, 'Senior Developer' );
INSERT INTO emp_2020(emp_id ,Designation ) VALUES (4, 'Manager' );

select * from emp_2020;
select * from emp_2021;


INSERT INTO emp_2021(emp_id ,Designation ) VALUES (1, 'Developer');
INSERT INTO emp_2021(emp_id ,Designation ) VALUES (2, 'Developer');
INSERT INTO emp_2021(emp_id ,Designation ) VALUES (3, 'Manager');
INSERT INTO emp_2021(emp_id ,Designation ) VALUES (5, 'Trainee');

select e20.* , e21.*
from emp_2020 as e20
left join emp_2021 as e21
on e20.emp_id = e21.emp_id
UNION 
select e20.* , e21.*
from emp_2021 as e21
right join emp_2020 as e20
on e21.emp_id = e20.emp_id;





