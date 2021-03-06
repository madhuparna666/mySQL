

:round_pushpin: PROBLEM

            Table: Weather

            +---------------+---------+
            | Column Name   | Type    |
            +---------------+---------+
            | id            | int     |
            | recordDate    | date    |
            | temperature   | int     |
            +---------------+---------+
            id is the primary key for this table.
            This table contains information about the temperature on a certain day.


            Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

            Return the result table in any order.

            The query result format is in the following example.



            Example 1:

            Input: 
            Weather table:
            +----+------------+-------------+
            | id | recordDate | temperature |
            +----+------------+-------------+
            | 1  | 2015-01-01 | 10          |
            | 2  | 2015-01-02 | 25          |
            | 3  | 2015-01-03 | 20          |
            | 4  | 2015-01-04 | 30          |
            +----+------------+-------------+
            Output: 
            +----+
            | id |
            +----+
            | 2  |
            | 4  |
            +----+
            Explanation: 
            In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
            In 2015-01-04, the temperature was higher than the previous day (20 -> 30).



:round_pushpin: SOLUTION 1:


              SELECT w.id 
              FROM Weather AS w
              JOIN Weather as r 
              ON DATEDIFF(w.recordDate , r.recordDate) = 1
              AND w.temperature > r.temperature;


:round_pushpin: SOLUTION 2:

                        SELECT w.id 
                        FROM Weather AS w , Weather as r 
                        WHERE DATEDIFF(w.recordDate , r.recordDate) = 1
                        AND w.temperature > r.temperature;


:round_pushpin:  NOTE:


                        Return the difference between two date values, in years:

                        SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff
                        
                        OUTPUT :
                        
                        DateDiff
                        -6






