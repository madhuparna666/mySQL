use customer;

create table movie(
seat varchar(50),occupancy int
);

insert into movie values
('a1',1),('a2',1),('a3',0),('a4',0),('a5',0),('a6',0),('a7',1),('a8',1),('a9',0),('a10',0),
('b1',0),('b2',0),('b3',0),('b4',1),('b5',1),('b6',1),('b7',1),('b8',0),('b9',0),('b10',0),
('c1',0),('c2',1),('c3',0),('c4',1),('c5',1),('c6',0),('c7',1),('c8',0),('c9',0),('c10',1);

select * from movie; 

-- there are 3 rows in a movie-hall each with 10 seats in each row
-- waq to find 4 consecutive Empty Seats
-- a , b , c arerows , where a1 to a10 are seat_id; same goes for b,c

-- function : left(): EXTRACT 3 CHARACTERS FROM THE STRING[ STARTING FROM LEFT ] , 
-- right() : EXTRACT Number of CHARACTERS FROM THE STRING[ STARTING FROM RIGHT ] ;
-- left ( "string" , 1 ) : 1 is number of char to extract	
-- substring( "sql tutorial" , 5,3 ) : output - tut


WITH CTE1 AS 
(
select * 
, left(seat,1) as row_id,CAST(substring(seat,2,2) AS SIGNED) as seat_id
from movie) 
,cte2 as  -- cte 2
(
SELECT * 
, MAX(occupancy) OVER(PARTITION BY row_id ORDER BY seat_id ROWS BETWEEN CURRENT ROW AND 3 FOLLOWING  ) AS is_4_empty
, count(occupancy) OVER(PARTITION BY row_id ORDER BY seat_id ROWS BETWEEN CURRENT ROW AND 3 FOLLOWING  ) AS cnt
FROM CTE1 
)
,cte3 as -- cte 3
(
select * from cte2 where is_4_empty = 0 and cnt = 4)

select cte2.*
from cte2
inner join cte3
on cte2.row_id = cte3.row_id
and cte2.seat_id between cte3.seat_id and cte3.seat_id+3;






















