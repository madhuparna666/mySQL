/*
Tutorial 7: Views 

view is a virtual table based on the result set of sql query
*/


create table student1
(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(25)not null,
age int ,
primary key(studentid)
);
insert into student1 values (1,"Raya", "Dutta", 24),
(2,"Ram", "Sharma", 31 ),
(3,"Sham", "Joe", 31);
select * from student1;

create table department1(
studentid int auto_increment,
department_name varchar(30) not null,
foreign key(studentid) references student1(studentid)
);
desc department1;

insert into department1 values (1, "Computer science"),
(2, "Electronics"),
(3, "Mechanical");
select * from department1;
select * from student1;


select first_name , last_name , age , department_name from student1
inner join department1 
using (studentid);

-- create view to store the > inner join code 

create view vw_student_info as 
select first_name , last_name , age , department_name from student1
inner join department1 
using (studentid);

select * from vw_student_info;

