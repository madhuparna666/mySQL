/*
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
id is an autoincrement column.
 
Write an SQL query to find all numbers that appear at least three times consecutively.
Return the result table in any order.
The query result format is in the following example.

 
Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.


*/


SELECT DISTINCT L1.NUM AS ConsecutiveNums
FROM LOGS L1
JOIN LOGS L2
ON L1.ID = L2.ID+1 AND L1.NUM = L2.NUM

JOIN LOGS L3
ON L1.ID = L3.ID+2 AND L1.NUM = L3.NUM;



/*
output:

Your input
{"headers": {"Logs": ["id", "num"]}, "rows": {"Logs": [[1, 1], [2, 1], [3, 1], [4, 2], [5, 1], [6, 2], [7, 2]]}}

Output:
{"headers": ["ConsecutiveNums"], "values": [[1]]}

Expected:
{"headers": ["ConsecutiveNums"], "values": [[1]]}

*/