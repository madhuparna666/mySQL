### Leetcode 183 : Easy

Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID and name of a customer.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key column for this table.
customerId is a foreign key of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.


SOLUTION :

/*
SELECT c.NAME AS Customers
FROM Customers c
LEFT JOIN ORDERS o
ON  c.id = o.customerId
WHERE o.customerId is null;

*/

SELECT NAME AS Customers
FROM Customers
WHERE ID NOT IN 
(
  SELECT customerId 
    FROM ORDERS
);





