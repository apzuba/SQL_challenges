
-- Difficulty: Hard
-- Samantha interviews many candidates from different colleges using 
-- coding challenges and contests. Write a query to print the contest_id, 
-- hacker_id, name, and the sums of total_submissions, 
-- total_accepted_submissions, total_views, and total_unique_views for 
-- each contest sorted by contest_id. Exclude the contest from 
-- the result if all four sums are .

-- Note: A specific contest can be used to screen candidates at more 
-- than one college, but each college only holds  screening contest.

SELECT 
    C.contest_id, C.hacker_id, C.name,
    SUM(SS.sum_ts) Sts,
    SUM(SS.sum_tas) Stas,
    SUM(VS.sum_views) Stv,
    SUM(VS.sum_unique) Stuv
FROM Contests C
    LEFT JOIN Colleges Co 
    USING(contest_id)
    LEFT JOIN Challenges Ch 
    USING(college_id)
    LEFT JOIN (SELECT challenge_id,
          SUM(total_views) sum_views,
          SUM(total_unique_views) sum_unique
          FROM View_Stats
          GROUP BY challenge_id) VS 
    USING(challenge_id)
    LEFT JOIN (SELECT challenge_id,
          SUM(total_submissions) sum_ts,
          SUM(total_accepted_submissions) sum_tas
          FROM Submission_Stats
          GROUP BY challenge_id) SS
    USING(challenge_id)
GROUP BY contest_id, hacker_id, name
HAVING Sts + Stas + Stv + Stuv > 0
;