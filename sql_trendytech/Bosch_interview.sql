show databases;
use customer;

create table call_details  (
call_type varchar(10),
call_number varchar(12),
call_duration int
);

insert into call_details values 
		('OUT','181868',13),('OUT','2159010',8)
		,('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1)
		,('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1)
		,('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9);
	
    
    
select * from call_details;  

/*
Write a sql query to determine the phone numbers That satisfies the below conditions:
1. The numbers have both incoming & outgoing calls
The sum of duration of outgoing calls should be greater than The sum of duration of incoming calls
*/

-- using cte & filter clause
with cte_numbers as (
select call_number,
sum(case when call_type = 'OUT' then call_duration else null end) as out_duration,
sum(case when call_type = 'INC' then call_duration else null end) as inc_duration
from call_details 
group by call_number) 

select call_number from cte_numbers
where out_duration is not null and inc_duration is not null
	  and out_duration > inc_duration;

-- using Having clause 

select call_number,
sum(case when call_type = 'OUT' then call_duration else null end) as out_duration ,
sum(case when call_type = 'INC' then call_duration else null end) as inc_duration
from call_details
group by call_number
having out_duration > 0 and inc_duration > 0 
and out_duration > inc_duration;
-- same with above, just removed out_duration , inc_duration from select statement
select call_number 
from call_details 
group by call_number
having sum(case when call_type = 'OUT' then call_duration else null end)  > 0 and
	   sum(case when call_type = 'INC' then call_duration else null end ) > 0 and 
       sum(case when call_type = 'OUT' then call_duration else null end) > sum(case when call_type = 'INC' then call_duration else null end );

