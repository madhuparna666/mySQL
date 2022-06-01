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



-- find the change in Employee Status
--  o/p - 1,3,4,5

-- we will do full outer join

select e20.* , e21.*
from emp_2020 as e20
left join emp_2021 as e21
on e20.emp_id = e21.emp_id
UNION 
select e20.* , e21.*
from emp_2020 as e20
right join emp_2021 as e21
on e21.emp_id = e20.emp_id;

-- null can't be compared with another null

-- I don't need the emp_id , whose designation is same for both the years 
-- wrong query
(select e20.* , e21.*
from emp_2020 as e20
left join emp_2021 as e21
on e20.emp_id = e21.emp_id
UNION 
select e20.* , e21.*
from emp_2020 as e20
right join emp_2021 as e21
on e21.emp_id = e20.emp_id) as employ
where e20.designation != e21.designation;













