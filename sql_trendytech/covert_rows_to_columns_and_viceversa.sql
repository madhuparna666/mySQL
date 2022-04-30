use customer;

SELECT * FROM emp_salary;



insert into emp_salary(id,salary_comp_type, val) VALUES(1, 'salary' ,10000);
insert into emp_salary(id,salary_comp_type, val) VALUES(1, 'bonus' ,5000);
insert into emp_salary(id,salary_comp_type, val) VALUES(1, 'hike_percent' ,10);

insert into emp_salary(id,salary_comp_type, val) VALUES(2, 'salary' ,15000);
insert into emp_salary(id,salary_comp_type, val) VALUES(2, 'bonus' ,7000);
insert into emp_salary(id,salary_comp_type, val) VALUES(2, 'hike_percent' ,8);

insert into emp_salary(id,salary_comp_type, val) VALUES(3, 'salary' ,12000);
insert into emp_salary(id,salary_comp_type, val) VALUES(3, 'bonus' ,6000);
insert into emp_salary(id,salary_comp_type, val) VALUES(3, 'hike_percent' ,7);

-- convert rows to column (pivoting)
sELECT * FROM emp_salary;

select id
, sum(case when salary_comp_type = 'salary' then val end) as salary
,sum(case when salary_comp_type = 'bonus' then val end) as bonus
, sum(case when salary_comp_type = 'hike_percent' then val end) as hike_percent
from emp_salary
group by id;

use customer;
# unpivoting

-- create the new pivot table, which I need to unpivot

-- failed to run this query
select 
id
,sum(case when salary_comp_type = 'salary' then val end) as salary
,sum(case when salary_comp_type = 'bonus' then val end) as bonus
,sum(case when salary_comp_type = 'hike_percent' then val end) as hike_percent
into emp_salary_pivott
from emp_salary
group by id;

select * from(
select id,'salary' as salary_comp_type,salary as val from emp_salary_pivott
union all
select id,'bonus' as salary_comp_type,bonus as val from emp_salary_pivott
union all 
select id,'hike_percent' as salary_comp_type,hike_percent as val from emp_salary_pivott
) a 
order by id
