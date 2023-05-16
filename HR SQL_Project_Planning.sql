
-- You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
-- It is guaranteed that the difference between the End_Date and 
-- the Start_Date is equal to 1 day for each row in the table.

-- If the End_Date of the tasks are consecutive, then 
-- they are part of the same project. Samantha is interested in finding the total number 
-- of different projects completed.

-- Write a query to output the start and end dates of projects listed by 
-- the number of days it took to complete the project in ascending order. 
-- If there is more than one project that have the same number of completion
-- days, then order by the start date of the project.


SELECT Start_date, End_date
FROM
(
    SELECT End_date, ROW_NUMBER() OVER (ORDER BY End_date) AS rn
    FROM
    (
        SELECT 
            Start_date, 
            End_date, 
            IFNULL(DATEDIFF(
                LEAD(End_date) OVER (ORDER BY End_date), 
                End_date), 0) 
        AS day_diff
        FROM Projects
    ) sbq1
    WHERE day_diff != 1
) AS E
INNER JOIN
(
    SELECT Start_date, ROW_NUMBER() OVER (ORDER BY Start_date) AS rn
    FROM
    (
        SELECT 
            Start_date, 
            End_date, 
            IFNULL(DATEDIFF(
                Start_date, 
                LAG(Start_date) OVER (ORDER BY Start_date)), 0) 
            AS day_diff
        FROM Projects
    ) sbq2
    WHERE day_diff != 1
) AS S
USING(rn)
ORDER BY DATEDIFF(End_date, Start_date) ASC, Start_date ASC
;