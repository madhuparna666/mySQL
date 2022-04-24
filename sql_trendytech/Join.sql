
/*
Tutorial - 8
Inner Join
Left Join
Right Join
Full Join
Natural Join
Cross Join

Interview Questions 
*/

use customer;
select * from student1;
insert into student1 values (5,'Ramesh', 'Singh',27);
select * from department1;

## Inner Join - helps to retrieve the data
# in below example we are retrieving the student ids who have department 

select * from student1 
inner join department1 
on student1.studentid = department1.studentid;

## Left Join
-- focus is on the left table of the query= student1 ; right table doesn't matter 
-- will get all the values we have in left table
select * 
from student1 left join department1 
on student1.studentid = department1.studentid;

## Right join
-- focus is on the right table written in the query
select * 
from student1 right join department1 
on student1.studentid = department1.studentid;

## Full Outer Join
-- focus is on both the tables
-- below one is wrong approach to do full outer join 
select * 
from student1 full outer join department1 
on student1.studentid = department1.studentid;

-- Correct way to do full outer join by 'union' keyword
select * 
from student1 left join department1 
on student1.studentid = department1.studentid
union
select * 
from student1 right join department1 
on student1.studentid = department1.studentid;

## Cross join
-- it gives you ALL THE POSSIBLITIES BY combining all the records
select * 
from student1 cross join department1;

## Natural Join
--
select * 
from student1 natural join department1;


/*
Julia just finished conducting a coding contest, 
and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 

### table 1:
Hackers :
     COLUMN    | TYPE
     
     hacker_id | integer
     name      | string

### table 2:
Difficulty: The difficult_level is the level of difficulty of the challenge, 
and score is the score of the challenge for the difficulty level.

            COLUMN | TYPE
            
  difficulty_level | integer
     score         | integer

### table 3:
Challenges: 
The challenge_id is the id of the challenge, 
the hacker_id is the id of the hacker who created the challenge, 
and difficulty_level is the level of difficulty of the challenge

          COLUMN | TYPE
          
   challenge_id  | integer
   hacker_id     | integer
difficulty_level | integer

### table 4:

Submissions: 
The submission_id is the id of the submission, 
hacker_id is the id of the hacker who made the submission, 
challenge_id is the id of the challenge that the submission belongs to, 
and score is the score of the submission.
       
         COLUMN | TYPE
 submission_id  |  integer
 hacker_id      |  integer
 challenge_id   |  integer
   score        | integer
   
*/


