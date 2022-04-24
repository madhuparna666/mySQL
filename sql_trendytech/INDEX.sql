/* 
 tutorial : 6 -> INDEXES : use to query the table (fast);
 cons: late in updating , inserting value using index
*/

use customer;
show tables;

select * from person3;

create index index_city_cityname
on person3(city_name);

desc person3;

drop table student;
----------------------
create table student(
id int not null,
f_name varchar(25),
l_name varchar(25),
age int
);

create index index_age 
on student (age);

desc student;


create index index_age_fname
on student(age, f_name);

alter table student
drop index index_age_fname;

alter table student 
drop index index_age;
