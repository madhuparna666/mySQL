use customer;
create table t1 (id1 int);
create table t2 (id2 int);
drop table t1;
insert into t1 values(1);
insert into t1 values(1);
insert into t1 values(2);
insert into t1 values(2);

insert into t2 values(1);
insert into t2 values(1);
insert into t2 values(1);
insert into t2 values(3);

insert into t1 values(2);
insert into t2 values(2);

select * from t1;
select * from t2;
-- will return the matching records (in t1 if we have (1,1) and in t2 we have (1,1,1) 
-- then in output will get 6 number of 1s (2x3 = 6) )
select * from t1
inner join t2 on t1.id1 = t2.id2;
-- (2 x 3) + (3x1) = 9 records

select * from t1
left join t2 on t1.id1 = t2.id2;
-- (2x3) + (3x1) = 9

select * from t1
right join t2 on t1.id1 = t2.id2;
-- (2x3) + (3x1) + 1 {3 is nonmatching} = 10

/*in mysql we don't have full outer join 
so we can union left and right join
select * from t1
full outer join t2
on t1.id1 = t2.id2;

-- (matching from both side) + (non-matching from both side) = 10
*/
/* DOES SAME THING OF FULL OUTER JOIN*/
select * from t1
left join t2 on t1.id1 = t2.id2
UNION
select * from t1
right join t2 on t1.id1 = t2.id2;


-- when we are INSERTING 'NULL' VALUE using insert keyword in both the tables, 
-- then for a single row we will get null values as a result of doing join operation
-- *** > one Null is not equal to another null . this is important to remember, 
-- so as a output of Outer join it will return extra two values for each of the null 


insert into t1 values(null);
insert into t2 values(null);

