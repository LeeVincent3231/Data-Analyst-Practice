/*
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

Write a solution to find the employees who earn more than their managers.

  Notes:
  - Self-join Employee as (e) and (m) on managerId = m.id
  - Join on employee's managerId equal to manager's id
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
