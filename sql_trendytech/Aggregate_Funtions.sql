show databases;
use customer;

select * from students;

## Count
select count(*) from students;

SELECT COUNT(studemt_company) FROM students;
SELECT COUNT(DISTINCT studemt_company) FROM students; -- will return distinct company
SELECT studemt_company FROM students;

-- SHOW THE NUMBER OF BATCHES IN FEB 
SELECT COUNT(*) FROM STUDENTS WHERE BATCH_DATE LIKE '%-02-%';

## GROUP BY
-- GROUP SOME DATA BASED UPON SOME LOGIC
-- The column I want to group , That should be in SELECT part always

--  Q.1 HOW MANY PEOPLE HAVE JOINED THE COURSE THROUGH WHICH PLATFORM
select * from students;

SELECT SOURCE_OF_JOINING, COUNT(*)
FROM STUDENTS
GROUP BY SOURCE_OF_JOINING;

-- Q.2 : location wise how many students have joined the course?

SELECT location, COUNT(*) as No_of_Students_Joined
FROM students
GROUP BY location;

select count(location) from students; -- returns the total no of location

-- Q3. group by 2 columns - location , SOURCE_OF_JOINING

SELECT LOCATION, SOURCE_OF_JOINING, COUNT(*)
FROM STUDENTS
GROUP BY LOCATION, SOURCE_OF_JOINING;

--
SELECT LOCATION, SOURCE_OF_JOINING 
FROM STUDENTS;

-- Q4. HOW MANY PEOPLE ENROLLED FOR EACH COURSE?
SELECT selected_course, COUNT(*)
FROM students
GROUP BY selected_course;

select selected_course from students;

-- Q5. FOR EACH BATCH, HOW MANY courses are sold ?

-- (FOR SAME DATE IT WILL GROUP TOGETHER IF SELECTED_COURSE ID IS SAME )

SELECT batch_date,selected_course , COUNT(*) AS BATCHWISE_SOLD_COURSES
FROM STUDENTS
GROUP BY batch_date,selected_course;


select batch_date,selected_course
from students;

## MIN & MAX

SELECT MIN(years_of_exp)
FROM STUDENTS;

-- Q. to return the student-name having minimum years of exp
-- through error
SELECT MIN(years_of_exp), student_name
FROM STUDENTS;
-- to return the student-name having minimum years of exp
-- correct code
SELECT student_fname
FROM students
ORDER BY years_of_exp LIMIT 1;

select * from students;
-- For each course of joining I want max Experience
SELECT SOURCE_OF_JOINING, MAX(years_of_exp)
FROM students
GROUP BY SOURCE_OF_JOINING;

## SUM 
SELECT SOURCE_OF_JOINING, sum(years_of_exp)
FROM students
group by SOURCE_OF_JOINING;

## Avg
SELECT SOURCE_OF_JOINING, AVG(years_of_exp)
FROM students
group by SOURCE_OF_JOINING;

SELECT location, AVG(years_of_exp)
FROM students
group by location;

SELECT studemt_company, AVG(years_of_exp)
FROM students
group by studemt_company;













