CREATE DATABASE BATMAN;
USE BATMAN;
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department_id INT
);
CREATE TABLE BONUSES(
DEPARTMENT_ID INT,
BONUS INT);
INSERT INTO BONUSES(department_id, bonus)
SELECT department_id,
       CASE
           WHEN department_id = 101 THEN salary + 5000
           WHEN department_id = 102 THEN salary + 3000
           WHEN department_id = 103 THEN salary + 1000
           ELSE salary
       END AS bonus
FROM employee;


INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'Alice', 50000, 101),
(2, 'Bob', 60000, 101),
(3, 'Carol', 70000, 102),
(4, 'David', 55000, 102),
(5, 'Eve', 75000, 103),
(6, 'Frank', 45000, 101),
(7, 'Grace', 80000, 103);
--- scalar subquerys
SELECT name, salary
FROM employee
WHERE salary > (
    SELECT AVG(salary) FROM employee
);
--- CORRELATED SUBQUERYS
SELECT name, salary, department_id
FROM employee e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employee e2
    WHERE e2.department_id = e1.department_id
);
--- SUBQUERYS USING IN
SELECT name,SALARY
FROM employee
WHERE department_id IN (
    SELECT department_id FROM EMPLOYEE WHERE SALARY >50000
);
---- USING =
SELECT name,salary
FROM employee
WHERE salary = (
    SELECT MAX(salary) FROM employee
);
--- USING EXITS
SELECT name,SALARY
FROM employee
WHERE department_id IN (
    SELECT id FROM BONUSES WHERE BONUS=1000
);






