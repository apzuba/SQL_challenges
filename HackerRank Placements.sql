-- You are given three tables: Students, Friends and Packages. 
-- Students contains two columns: ID and Name. 
-- Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
-- Packages contains two columns: ID and Salary 
-- (offered salary in $ thousands per month).

-- Write a query to output the names of those students whose best friends 
-- got offered a higher salary than them. Names must be ordered by 
-- the salary amount offered to the best friends. 
-- It is guaranteed that no two students got same salary offer.


SELECT S.Name
FROM
    (
        SELECT Friend_ID, Name, Salary
        FROM Students JOIN Friends USING(ID) JOIN Packages USING(ID)
    ) AS S
    INNER JOIN
    (
        SELECT Friend_ID, Salary AS F_Salary
        FROM Friends JOIN Packages 
        ON Packages.ID = Friends.Friend_ID
    ) AS F
    USING(Friend_ID)
WHERE S.Salary < F.F_Salary
ORDER BY F_Salary ASC
;