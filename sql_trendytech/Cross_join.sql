use customer;

create table products
( id int primary key,
name varchar(45) );

insert into products(id , name) values (1, 'A');
insert into products(id , name) values (2, 'B');
insert into products(id , name) values (3, 'C');
insert into products(id , name) values (4, 'D');
insert into products(id , name) values (5, 'E');

CREATE TABLE colors 
( COLOR_ID INT PRIMARY KEY,
COLOR VARCHAR (20));

INSERT INTO colors (COLOR_ID , COLOR) VALUES(1,'blue');
INSERT INTO colors (COLOR_ID , COLOR) VALUES(2,'green');
INSERT INTO colors (COLOR_ID , COLOR) VALUES(3,'orange');

select * from products;
select * from colors;
-- cross join: in cross join we don't have to write the keyword 'join' to apply join

select p.* , c.*
from products p , colors c ;

