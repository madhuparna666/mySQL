use customer;

select * from students;
#1
select * 
from students 
where location != 'bengalore';

#2: get all the courses which has the word 'azure'
select * from trendytech;

select *
from trendytech
where course_name like '%azure%';

#3 get all the courses which don't have the word 'azure'
select * 
from trendytech
where course_name not like '%azure%';

# 4 all students from MUMBAI who joined through linkedin 
# having less than 2 yop
select *
from students
where years_of_exp < 2 and source_of_joining = 'LINKEDIN' and location = 'MUMBAI';


# 5 I want all the students who donot fall between 76 to 90 yop

select * 
from students
where years_of_exp < 76 OR years_of_exp > 90;

# BETWEEN 
select * 
from students
where years_of_exp BETWEEN 76 AND 90;

select * 
from students
where years_of_exp NOT BETWEEN 76 AND 90;
 
# get list of students who are working in Walmart and Meta
SELECT * 
FROM students
WHERE studemt_company = 'Walmart'
OR studemt_company = 'META';

#another way to do it
SELECT * 
FROM students
WHERE studemt_company IN ('Walmart' , 'META' );



SELECT * 
FROM students
WHERE studemt_company  NOT IN ('Walmart' , 'META' );

###

SELECT *
FROM TRENDYTECH;

-- will add a new column 'course_type' according to condition
SELECT course_id,course_name,course_fee,
    CASE 
        WHEN course_name LIKE '%Azure%' THEN 'Cloud'
        ELSE 'BigData'
    END AS course_type
FROM trendytech;




