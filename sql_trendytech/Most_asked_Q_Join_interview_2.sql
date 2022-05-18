use customer;
create table t1 (id1 int);
create table t2 (id2 int);
drop table t1;
insert into t1 values(1);
insert into t1 values(1);
insert into t1 values(2);

insert into t2 values(1);
insert into t2 values(1);
insert into t2 values(1);
insert into t2 values(3);

select * from t1;
select * from t2;
-- will return the matching records (in t1 if we have (1,1) and in t2 we have (1,1,1) 
-- then in output will get 6 number of 1s (2x3 = 6) )
select * from t1
inner join t2 on t1.id1 = t2.id2;

select * from t1
left join t2 on t1.id1 = t2.id2;

select * from t1
right join t2 on t1.id1 = t2.id2;
/*in mysql we don't have full outer join 
so we can union left and right join
select * from t1
full outer join t2
on t1.id1 = t2.id2;

*/
/* DOES SAME THING OF FULL OUTER JOIN*/
select * from t1
left join t2 on t1.id1 = t2.id2
UNION
select * from t1
right join t2 on t1.id1 = t2.id2;

