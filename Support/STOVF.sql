SELECT *
FROM Badges;

SELECT *
FROM Comments;

SELECT *
FROM LinkTypes;

SELECT *
FROM PostLinks;

SELECT *
FROM Posts;

SELECT *,
    CASE 
        WHEN ClosedDate IS NULL THEN 'still opened'
        WHEN DATEDIFF(day, CreationDate, ClosedDate) <= 15 THEN 'quickly solved'
        WHEN DATEDIFF(day, CreationDate, ClosedDate) BETWEEN 16 AND 30 THEN 'normal solved'
        WHEN DATEDIFF(day, CreationDate, ClosedDate) BETWEEN 31 AND 45 THEN 'slowly solved'
        ELSE 'very slowly solved'
    END AS resolution_status
FROM Posts
WHERE ViewCount != 0
--insights into not viewed columns
SELECT *,
    CASE
        WHEN ViewCount = 0 THEN 'Not opened'
        ELSE 'Opened'
    END AS Unsolved
FROM Posts;

SELECT *
FROM PostTypes;

SELECT *
FROM Users;

SELECT *
FROM Votes;

SELECT *
FROM VoteTypes;










