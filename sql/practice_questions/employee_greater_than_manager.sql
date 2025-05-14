/*
  LeetCode 181 ‒ Employees Earning More Than Their Managers
  Difficulty: Easy        Accepted : 2025-05-13
  URL: https://leetcode.com/problems/employees-earning-more-than-their-managers/

    Schema:
    Employee(id INT, name VARCHAR, salary INT, managerId INT)

    Notes:
  • Self-join Employee as (e) and (m) on managerId = m.id
  • Join on employee's managerId equal to manager's id
*/

SELECT
    e.name AS employee
FROM
    Employee e
JOIN
    Employee m
      ON e.managerId = m.id
WHERE
    e.salary > m.salary;

/*
  Snowflake-optimized variant
  ‒ Uses QUALIFY with an analytic FIRST_VALUE() to avoid an explicit join

SELECT
    name
FROM
    Employee
QUALIFY
    salary > FIRST_VALUE(salary) OVER (PARTITION BY managerId);

*/
