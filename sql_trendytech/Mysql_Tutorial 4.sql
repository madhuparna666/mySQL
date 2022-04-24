
/*
1. Not Null
2. Unique Key
3. Primary Key
4. Foreign Key
5. Check
6. Default
7. Index
*/

use customer;
### NOT NULL
create table student(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
); 

desc student;

alter table student modify age int not null; 

### Unique Key

create table person1(
id int not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
age int not null,
unique (id)
);

desc person1;

alter table person1 
add unique(first_name);

insert into person1 values(11,'Raya', 'dutta',23);
insert into person1 values(11,'Raya', 'dutta1',24); # should throgh error cause I specified id - uniqye

insert into person1 values(12,'Raya', 'dutta2',25); # should throgh error cause I modified the Name - Unique
insert into person1 values(12,'Raka', 'dutta3',26);

select * from person1;

alter table person1
add constraint uc_person1 unique(age, first_name);

insert into person1 values(2, 'Sawnakh','roy',28);
insert into person1 values(3, 'Sawnakh' , 'saha' ,28);  # should throgh error cause I already added constraint uc_person1 in the table;
                                                        # for which age and first_name can't be same together.
                                                        
insert into person1 values(3,'Saw' , 'saha' , 28); 

select * from person1;
desc person1; ## Describe person1 ; Desc == Describe; See the 'Key' of 'AGE' column                                                 
# deop index uc_person1 ## to drop the contraint

-- Primary Key
create table person2(
id int not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
age int,
constraint pk_person primary key(id,last_name)
);

desc person2;

alter table person2 
drop primary key;  # to drop all the primary key in a time

alter table person2
add primary key(id); # to set id column asa primary key


-- tutorial 5 
-- Foreign Key

create table department(
id int not null, 
department_id int not null,
department_name varchar(30) not null,
primary key(department_id)
);

alter table department 
add foreign key(id) references person2(id);

/* 
ALTERNATIVE WAY TO DECLARE FOREIGN KEY 

create table department(
id int not null, 
department_id int not null,
department_name varchar(30) not null,
primary key(department_id),
constraint fk_persondepartment foreign key(id) references person2(id)	
);

*/

-- default constraint

create table person3(
id int not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
city_name varchar(30) default 'Bangalore'
);

desc person3;









 