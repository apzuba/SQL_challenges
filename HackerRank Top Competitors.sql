-- HackerRank Top Competitors task

-- Julia just finished conducting a coding contest, and 
-- she needs your help assembling the leaderboard! 
-- Write a query to print the respective hacker_id and 
-- name of hackers who achieved full scores for more than one challenge. 
-- Order your output in descending order by the total number of challenges 
-- in which the hacker earned a full score. If more than one hacker received 
-- full scores in same number of challenges, 
-- then sort them by ascending hacker_id.


SELECT H.Hacker_id, H.name
FROM Hackers H JOIN Challenges C JOIN Submissions S JOIN Difficulty D
ON  S.hacker_id = H.hacker_id AND 
    D.difficulty_level = C.difficulty_level AND
    C.challenge_id = S.challenge_id
WHERE S.score = D.score
GROUP BY H.Hacker_id, H.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, Hacker_id ASC;