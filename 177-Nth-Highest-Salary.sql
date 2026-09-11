CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
              SELECT salary
        FROM (
            SELECT
                salary,
                DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
            FROM Employee
        ) AS t
        WHERE salary_rank = N LIMIT 1
  );
END