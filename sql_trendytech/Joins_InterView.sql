
show databases;
use customer;

select * from trendytech;

select * from students;

-- selected_course(students table ) and course_id (trendytech table) are logically same
SELECT course_name,course_id
FROM trendytech
WHERE course_id = 
(SELECT selected_course
FROM students
WHERE student_fname = 'ARPITA');

-- join 
-- (by default : its Inner join)
-- here only matching records are considered

SELECT students.student_fname , students.student_lname, trendytech.course_name
FROM students 
JOIN trendytech
ON students.selected_course = trendytech.course_id;

-- this will through error ;
-- cause course_id is foreign key 
delete course_name 
from trendytech where course_id = 1;

-- if we don't join the  above tables then we can delete it easily
-- so let's create one copy of students table 

 CREATE TABLE courses_latest 
 AS SELECT * FROM trendytech;
 
 select * from courses_latest;
 -- deleting the value now - # to execute this we should change the settings
delete 
from courses_latest where course_id = 1;
 
-- Left Join / Left Outer join
-- here matching records are considered from both the tables
-- PLUS the non-matching records in the left table which does not have the match in the right  padded with nulls

SELECT students.student_fname , students.student_lname, trendytech.course_name
FROM students 
LEFT JOIN trendytech
ON students.selected_course = trendytech.course_id;

-- Right Join / right outer join
-- here matching records are considered from both the tables
-- PLUS the non-matching records in the right table which does not have the match in the left padded with nulls
SELECT students.student_fname , students.student_lname, trendytech.course_name
FROM students 
RIGHT JOIN trendytech
ON students.selected_course = trendytech.course_id;

-- Full Outer Join: combination of right & left join
-- all the matching records 
-- all the non-matching records from left table
-- all the non matching records from right table

-- IN MYSQL WE DON'T HAVE THE KEYWORD : FULL OUTER JOIN

-- WE CAN DO THE SAME OPERATION USING 'UNION'

SELECT students.student_fname , students.student_lname, trendytech.course_name
FROM students 
LEFT JOIN trendytech
ON students.selected_course = trendytech.course_id
UNION
SELECT students.student_fname , students.student_lname, trendytech.course_name
FROM students 
RIGHT JOIN trendytech
ON students.selected_course = trendytech.course_id;




