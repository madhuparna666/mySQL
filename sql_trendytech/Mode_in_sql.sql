-- mode is most frequent value in the array

use customer;

create table mode(id int);

insert into mode(id)values(1);
insert into mode(id)values(2);
insert into mode(id)values(2);

insert into mode(id)values(3);
insert into mode(id)values(3);
insert into mode(id)values(3);
insert into mode(id)values(3);

insert into mode(id)values(4);
insert into mode(id)values(5);

select * from mode;



-- will return the frequency of each unique number
select id, count(*) as freq from mode group by id;

-- Method CTE(common table expression)

with freq_cte as (
select id, count(*) as freq from mode group by id)

select * from freq_cte
where freq = 
	(select max(freq) from freq_cte);








