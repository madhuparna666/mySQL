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
-- each record of product is connected with colors
select * from products,colors;
select * from colors;

CREATE TABLE transaction(
order_id INT PRIMARY KEY,
product_name varchar(20),
color varchar(20),
size varchar(10),
amount INT
);

INSERT INTO transaction (order_id,product_name,color,size,amount)
VALUES (1,'A','Blue','L', 300);
INSERT INTO transaction (order_id,product_name,color,size,amount)
VALUES (2,'B','Blue','XL', 150);
INSERT INTO transaction (order_id,product_name,color,size,amount)
VALUES (3,'B','Green','L', 250);
INSERT INTO transaction (order_id,product_name,color,size,amount)
VALUES (4,'C','Blue','L', 250);
INSERT INTO transaction (order_id,product_name,color,size,amount)
VALUES (5,'E','Green','L', 270);
INSERT INTO transaction (order_id,product_name,color,size,amount)
VALUES (6,'D','Orange','L', 200);
INSERT INTO transaction (order_id,product_name,color,size,amount)
VALUES (7,'D','Green','M', 250);

SELECT * FROM transaction;

CREATE TABLE sizes 
( SIZE_ID INT PRIMARY KEY,
SIZE VARCHAR (20));

INSERT INTO sizes (SIZE_ID,SIZE)values (1,'M');
INSERT INTO sizes (SIZE_ID,SIZE)values (2,'L');
INSERT INTO sizes (SIZE_ID,SIZE)values (3,'XL');
SELECT * FROM sizes;

## use case 1
-- give me the sales for each product/ color and size;
 select product_name , color , size , sum(amount)
 from transaction
 group by product_name , color , size ;
 -- if something is not sold then show me 0 ; SO HERE I CAN USE CROSS JOiN
 
 WITH MASTER_DATA AS (
 SELECT p.name as product_name , c.color , s.size
 from products p,colors c ,sizes s),
 SALES AS (select product_name , color , size , sum(amount) AS total_amount
 from transaction
 group by product_name , color , size)
 select md.product_name,md.color,md.size,coalesce(s.total_amount,0)as total_amount
 from MASTER_DATA md
 left join sales s 
 on md.product_name = s.product_name
 and md.color = s.color 
 and md.size = s.size
 ORDER BY total_amount;
 -- coalesce() --> is similar with isnull() funciton
 -- replaced the null values with 0 
 
 
## use-case 2 :
-- prepare large no of rows for performance testing


-- cross join: in cross join we don't have to write the keyword 'join' to apply join

select p.* , c.*
from products p , colors c ;









