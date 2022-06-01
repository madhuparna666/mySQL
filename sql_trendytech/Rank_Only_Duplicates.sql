create table list(id char(30));
select * from list;
-- a = 2 , b = 1, c= 3 , d = 2
drop table list;

insert into list values('a');
insert into list values('a');
insert into list values('b');
insert into list values('c');
insert into list values('c');
insert into list values('c');

insert into list values('d');
insert into list values('d');


-- remove duplicates 
/*
1. We have to give ranks to those ids only who has duplicates in the table 
2. The ids who doesn't have duplicate will retuen "NULL"
3. So, in this case rank() is appropriate over dense_rank()
*/

# finding those ids who have duplicates
select id 
from list 
group by id 
having count(id) > 1;

-- work same like above query
select id 
from list 
group by id 
having count(1) > 1;

#
with cte_dups as (
select id 
from list 
group by id 
having count(1) > 1),
cte_rank as (select * , rank() over(order by id asc ) as rank_of_duplicates
from cte_dups)
select l.*, rank_of_duplicates
from list l left join cte_rank cr
on l.id = cr.id;








