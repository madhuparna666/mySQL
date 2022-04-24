use sample;
# Common table Expression(CTE)

CREATE TABLE customer
(
 CustomerNumber int,
 CustomerName varchar(60),
 Country varchar(60),
 State varchar(40)
)
;
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1223,"Ross", "CANADA", "BC");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1270,"Mike", "South Korea", "seoul");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1287,"Harvey", "India", "Bengal");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1289,"Rachael", "America", "Bay Area");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1276,"Stefen", "CANADA", "vds");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1221,"Madhu", "CANADA", "BC");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1100,"Richard", "CANADA", "BC");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1200,"Rose", "CANADA", "BC");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1567,"Lisa", "CANADA", "BC");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1345,"Michael", "South Korea", "seoul");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1734,"Jenny","South Korea", "seoul");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1589,"Jimin", "South Korea", "seoul");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1367,"J-Hope", "South Korea", "seoul");n
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1890,"Namjoon","South Korea", "ghj");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1104,"Jungkook", "CANADA", "fghh");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1020,"Kim Taehyung", "CANADA", "hygv");
INSERT INTO customer(CustomerNumber,CustomerName,Country,State) VALUES(1781,"Suga", "Australia", "mkak");

select * from customer;

# cte

WITH cte_in_customer AS (SELECT CustomerNumber,CustomerName,State FROM customer WHERE Country = "South Korea") SELECT * FROM cte_in_customer WHERE State = "seoul";


