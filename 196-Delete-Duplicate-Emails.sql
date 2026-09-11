# Write your MySQL query statement below
DELETE p
FROM Person p
JOIN (
    SELECT id
    FROM (
        SELECT
            id,
            ROW_NUMBER() OVER (
                PARTITION BY email
                ORDER BY id
            ) AS rn
        FROM Person
    ) AS t
    WHERE rn > 1
) AS d
ON p.id = d.id;