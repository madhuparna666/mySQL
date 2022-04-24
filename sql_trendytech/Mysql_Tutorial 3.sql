/*

tutorial 3 : Mysql

SQL Null values
SQL Update statement
SQL Delete Statement
SQL ALter table

 -- Add column in existing column
 -- Modify / Alter column
 -- Alter Table - Drop Column

*/

# create database

create database customer;

show databases;
use customer;



# create customer_info table

create table customer_info (
id integer auto_increment,
first_name varchar(25),
last_name varchar(25),
salary integer,
primary key(id)
);


select * from customer_info;

# insert values into the table

insert into customer_info(first_name,last_name,salary)
values
('John', 'Daniel' ,50000),
('Krish' , 'Naik', 60000),
('Darius' , 'Bengali' ,70000),
('Chandan' , 'Kumar' ,40000),
('Ankit' , 'Sharma' , NULL);

# null = missing ;not 0

select * from customer_info where salary is null;
select * from customer_info where salary is not null;


# SQL Update -- Replace Null Values

update customer_info set salary = 50000 where id = 5;

select * from customer_info;

# SQL delete 

delete from customer_info where id = 5;

# sql Alter table 
## ADd column name in Existing table

alter table customer_info add email varchar(25);

alter table customer_info add dob date;


## modify column using "Alter"

# modify data type of DOB column
alter table customer_info modify dob year;

# Alter table to Drop column

alter table customer_info drop column email;



