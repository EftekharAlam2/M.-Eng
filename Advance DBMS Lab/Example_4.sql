-- Creating tables
CREATE TABLE meve_employee (
    employee_name VARCHAR2(50),
    street VARCHAR2(50),
    city VARCHAR2(50)
);

CREATE TABLE meve_company (
    company_name VARCHAR2(50),
    city VARCHAR2(50)
);

CREATE TABLE meve_works (
    employee_name VARCHAR2(50),
    company_name VARCHAR2(50),
    salary NUMBER
);

CREATE TABLE meve_manages (
    employee_name VARCHAR2(50),
    manager_name VARCHAR2(50)
);

-- Inserting data into the tables
INSERT ALL
    INTO meve_employee (employee_name, street, city) VALUES ('Arif', '51 upashahar', 'Rajshahi')
    INTO meve_employee (employee_name, street, city) VALUES ('Sumon', '52 east', 'Moynamati')
    INTO meve_employee (employee_name, street, city) VALUES ('Sagor', 'Neemgachhi', 'Sirajgong')
    INTO meve_employee (employee_name, street, city) VALUES ('Abdul', 'Binodpur', 'Rajshahi')
    INTO meve_employee (employee_name, street, city) VALUES ('Himesh', 'Nazrul avenue', 'Dhaka')
    INTO meve_employee (employee_name, street, city) VALUES ('Amirul', 'Chawk bazar', 'Sylhet')
    INTO meve_employee (employee_name, street, city) VALUES ('Sajib', '99 north', 'Chittagong')
    
    INTO meve_company (company_name, city) VALUES ('Agrani', 'Rajshahi')
    INTO meve_company (company_name, city) VALUES ('Sonali', 'Sylhet')
    INTO meve_company (company_name, city) VALUES ('Janata', 'Dhaka')
    
    INTO meve_works (employee_name, company_name, salary) VALUES ('Sumon', 'Agrani', 12000)
    INTO meve_works (employee_name, company_name, salary) VALUES ('Abdul', 'Sonali', 13000)
    INTO meve_works (employee_name, company_name, salary) VALUES ('Himesh', 'Agrani', 6000)
    INTO meve_works (employee_name, company_name, salary) VALUES ('Amirul', 'Sonali', 20000)
    INTO meve_works (employee_name, company_name, salary) VALUES ('Sagor', 'Sonali', 8000)
    INTO meve_works (employee_name, company_name, salary) VALUES ('Arif', 'Janata', 13000)
    INTO meve_works (employee_name, company_name, salary) VALUES ('Sajib', 'Janata', 9000)
    
    INTO meve_manages (employee_name, manager_name) VALUES ('Amirul', 'Amirul')
    INTO meve_manages (employee_name, manager_name) VALUES ('Abdul', 'Amirul')
    INTO meve_manages (employee_name, manager_name) VALUES ('Sagor', 'Amirul')
    INTO meve_manages (employee_name, manager_name) VALUES ('Sumon', 'Sumon')
    INTO meve_manages (employee_name, manager_name) VALUES ('Himesh', 'Sumon')
    INTO meve_manages (employee_name, manager_name) VALUES ('Arif', 'Arif')
    INTO meve_manages (employee_name, manager_name) VALUES ('Sajib', 'Arif')
SELECT * FROM dual;


--2
SELECT employee_name 
FROM meve_works 
WHERE company_name = 'Sonali';


--3
SELECT e.employee_name, e.street, e.city
FROM meve_employee e
JOIN meve_works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Agrani';


--4
SELECT e.employee_name, e.street, e.city
FROM meve_employee e
JOIN meve_works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Sonali' AND (w.salary * 12) > 120000;


--5
SELECT e.employee_name
FROM meve_employee e
JOIN meve_works w ON e.employee_name = w.employee_name
JOIN meve_company c ON w.company_name = c.company_name
WHERE e.city = c.city;


--6
SELECT e1.employee_name
FROM meve_employee e1
JOIN meve_manages m ON e1.employee_name = m.employee_name
JOIN meve_employee e2 ON m.manager_name = e2.employee_name
WHERE e1.city = e2.city AND e1.street = e2.street;


--7
SELECT employee_name
FROM meve_works
WHERE company_name != 'Sonali';


--8
SELECT w1.employee_name
FROM meve_works w1
WHERE w1.salary > ALL (SELECT w2.salary FROM meve_works w2 WHERE w2.company_name = 'Janata');


--9
SELECT w.employee_name
FROM meve_works w
JOIN (SELECT company_name, AVG(salary) AS avg_salary FROM meve_works GROUP BY company_name) avg_salary_per_company
ON w.company_name = avg_salary_per_company.company_name
WHERE w.salary > avg_salary_per_company.avg_salary;


--10
SELECT company_name
FROM meve_works
GROUP BY company_name
ORDER BY COUNT(employee_name) DESC
FETCH FIRST 1 ROWS ONLY;


--11
SELECT company_name
FROM meve_works
GROUP BY company_name
ORDER BY SUM(salary) ASC
FETCH FIRST 1 ROWS ONLY;


--12
WITH agrani_avg AS (
    SELECT AVG(salary) AS avg_salary FROM meve_works WHERE company_name = 'Agrani'
)
SELECT company_name
FROM meve_works
GROUP BY company_name
HAVING AVG(salary) > (SELECT avg_salary FROM agrani_avg);


--13
UPDATE meve_employee
SET city = 'Natore'
WHERE employee_name = 'Arif';


--14
UPDATE meve_works
SET salary = salary * 1.10
WHERE company_name = 'Agrani';


--15
UPDATE meve_works
SET salary = salary * 1.10
WHERE employee_name IN (
    SELECT manager_name
    FROM meve_manages
    WHERE employee_name IN (SELECT employee_name FROM meve_works WHERE company_name = 'Agrani')
);


--16
UPDATE meve_works
SET salary = CASE
    WHEN salary * 1.10 <= 19000 THEN salary * 1.10
    ELSE salary * 1.03
END
WHERE employee_name IN (SELECT DISTINCT manager_name FROM meve_manages);


--17
DELETE FROM meve_works
WHERE company_name = 'Janata';


--18
CREATE VIEW manager_avg_salary AS
SELECT m.manager_name, AVG(w.salary) AS avg_salary
FROM meve_manages m
JOIN meve_works w ON m.employee_name = w.employee_name
GROUP BY m.manager_name;
