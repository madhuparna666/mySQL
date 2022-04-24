/* 
SQL Tutorial BY TrendyTech:
distinct
order by
LIMIT
LIKE 
*/

CREATE TABLE students (
student_id int AUTO_INCREMENT,
student_fname varchar(30) NOT NULL,
student_lname varchar(30) NOT NULL,
student_mname varchar(30),
student_email varchar(30) NOT NULL,
student_phone varchar(15) NOT NULL,
student_alternative_phone varchar(15),
enrollment_date TIMESTAMP NOT NULL,
years_of_exp int NOT NULL,
studemt_company varchar(30),
batch_date varchar(30) NOT NULL,
source_of_joining varchar(30) NOT NULL,
location varchar(30) NOT NULL,
primary key (student_id),
unique key (student_email)
);

create table courses (
course_id int NOT NULL,
course_name varchar(40) NOT NULL,
course_duration_months int NOT NULL,
course_fee int NOT NULL,
PRIMARY KEY (course_id)
);

INSERT INTO COURSES VALUES( 1, 'BIG DATA',6,50000);
INSERT INTO COURSES VALUES( 2, 'DEVOPS',1,10000);
INSERT INTO COURSES VALUES( 3, 'WEB DEVELOPMENT',3,20000);
INSERT INTO COURSES VALUES( 4, 'DATA SCIENCE',6,40000);

desc courses; 
select * from courses;
desc students;



insert into students
(student_fname,student_lname,student_email,student_phone,enrollment_date,years_of_exp,studemt_company,
batch_date, source_of_joining,location)
values('Rahul','Dravid','rahul@gmail.com','9494949494',"2021-01-15",8,'Walmart','19-02-2021','quora','Chennai');

insert into students
(student_fname,student_lname,student_email,student_phone,enrollment_date,years_of_exp,studemt_company,
batch_date, source_of_joining,location)
values('Rahul','Sharma','rahulsharma@gmail.com','9449489760',"2020-01-15",90,'Amazon','9-02-2021','linkedin','bengalore');

insert into students
(student_fname,student_lname,student_email,student_phone,enrollment_date,years_of_exp,studemt_company,
batch_date, source_of_joining,location)
values('Dhoni','Singh','dhoni@gmail.com','6245664949',"2022-01-15",76,'Facebook','22-02-2021','linkedin','bengalore');

insert into students
(student_fname,student_lname,student_email,student_phone,enrollment_date,years_of_exp,studemt_company,
batch_date, source_of_joining,location)
values('Rohit','Singh','Rohit@gmail.com','7675449087',"2021-01-15",77,'Facebook','21-02-2021','linkedin','bengalore');

insert into students
(student_fname,student_lname,student_email,student_phone,enrollment_date,years_of_exp,
batch_date, source_of_joining,location)
values('Virat','Kohli','Kohli@gmail.com','6245788949',"2022-01-11",76,'22-03-2022','linkedin','bengalore');

insert into students
(student_fname,student_lname,student_email,student_phone,enrollment_date,years_of_exp,
batch_date, source_of_joining,location)
values('Jihoo_','hyung','Jhoo@gmail.com','6245787899',"2021-02-11",76,'25-03-2022','linkedin','bengalore');



## Distinct
-- want to check the which all cities from people are joining my course
select location from students; -- will give repeatative data

select DISTINCT location from students; -- not duplicates

-- my students are already working in which company?
select studemt_company from students;
SELECT DISTINCT studemt_company from students;

## Order By
-- to ordering the data
select location from students order by years_of_exp;


show databases;
use customer;


## LIMIT 
-- The LIMIT clause is used to set an upper limit on the number of tuples returned by SQL
-- The limit/offset expressions must be a non-negative integer
SELECT * FROM STUDENTS ORDER BY studemt_company LIMIT 3; -- 3 means 3 records (asc)
select * from students order by studemt_company limit 2,3;
SELECT * FROM STUDENTS ORDER BY STUDENT_ID LIMIT 2,3; -- 2 is starting index 2nd index (indexing start from 0 )
-- 3 means no of records = 3 ;note: indexing is depended on 'order by' column 

## LIKE
-- % is a wildcard character

-- '%ra%' will return the names which contains 'ra'
select location,student_fname from students where student_fname like '%ra%'; 

-- 'ra%' will return the names starting with 'ra'
select location,student_fname from students where student_fname like 'ra%';

-- '%ra' will return the names ending with 'a'
select location,student_fname from students where student_fname like '%a';
-- in below query I am searching the name which contains '_'. 
-- Here I am using '\' to escape cause '_' is sign I am searching . soI have to use '\'
select location,student_fname from students where student_fname like '%\_';




