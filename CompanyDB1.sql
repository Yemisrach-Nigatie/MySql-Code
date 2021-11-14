USE CompanyDB;

#QUESTION 1 

SELECT p.prj_name, e.dept_number, e.emp_last_name
FROM WORKSON w
JOIN PROJECT p ON p.prj_number=w.prj_number
JOIN EMPLOYEE e ON e.emp_sin=w.emp_sin
Join EMPLOYEE m on e.emp_sin=m.manager_sin
WHERE p.`prj_location`='Montréal';

#QUESTION 2 
SELECT emp_first_name, emp_last_name, emp_address 
FROM EMPLOYEE
WHERE emp_address IN #the sql starting from this line helps us to filter the repeated employee address
(SELECT emp_address 
FROM EMPLOYEE
GROUP BY emp_address
HAVING COUNT(*)>1);

#QUESTION 3
SELECT DISTINCT E.emp_first_name, E.emp_address, E.emp_salary 
FROM EMPLOYEE AS E 
      JOIN
DEPARTMENT AS D
ON E.dept_number=D.dept_number 
WHERE E.emp_last_name LIKE 'E%' #filter the employee whose last name starts with the letter ’E’ 
AND (D.dept_Name = 'Marketing' OR D.dept_Name = 'Administration');#filter the employee who works for either of the specified departments 

#OR

SELECT  E.emp_first_name, E.emp_address, E.emp_salary 
FROM EMPLOYEE E,DEPARTMENT D
WHERE E.dept_number=D.dept_number
AND E.emp_last_name LIKE 'E%' 
AND D.dept_Name in ('Marketing','Administration');

#QUESTION 4 
/*ASSUMPTION: Since the question mentions manager in general but not department manager, Recurrsive method 
is used here.*/
SELECT E.emp_first_name, E.emp_last_name
FROM EMPLOYEE E
WHERE EXISTS 
(SELECT * FROM DEPENDENT AS D 
WHERE D.emp_sin = E.emp_sin)# filter the employees who have dependents 
    AND EXISTS 
(SELECT * FROM EMPLOYEE 
WHERE E.emp_sin IN # starting from this line, filter the employee who is also a manager
( SELECT manager_sin 
from EMPLOYEE));

#OR

SELECT DISTINCT E.emp_first_name, E.emp_last_name
FROM EMPLOYEE E, EMPLOYEE M, DEPENDENT D 
WHERE D.emp_sin = E.emp_sin # filter the employees who have dependents 
AND E.emp_sin = M.manager_sin # starting from this line, filter the employee who is also a manager
GROUP BY E.emp_first_name, E.emp_last_name; #this line can replace the function of "DISTINCT" at this question

#OR
SELECT DISTINCT E.emp_first_name, E.emp_last_name
FROM EMPLOYEE AS E
JOIN EMPLOYEE M
WHERE E.emp_sin=M.manager_sin
AND EXISTS (SELECT * FROM DEPENDENT AS D WHERE D.emp_sin = E.emp_sin);

#QUESTION 5
SELECT sum(emp_salary) AS SumOfSalaries_Of_MarketingEmployees #this function displays the sum of the employee salary
FROM EMPLOYEE AS E
	JOIN 
DEPARTMENT AS D
ON E.dept_number=D.dept_number
WHERE D.dept_name = 'Marketing';# the sum function takes "the salary of employees who works only in the marketing department" as an input

#OR
SELECT sum(emp_salary) AS SumOfSalaries_Of_MarketingEmployees
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.dept_number=D.dept_number
AND D.dept_name = 'Marketing';

#QUESTION 6
SELECT dept_number, COUNT(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE emp_salary < 50000 AND dept_number IN
(SELECT dept_number FROM EMPLOYEE
GROUP BY dept_number 
	HAVING COUNT(*)>2) 
GROUP BY dept_number;

#QUESTION 7
SELECT D.dept_name, count(*) AS NumberOfEmployees
 FROM DEPARTMENT AS D, EMPLOYEE AS E 
 WHERE D.dept_number = E.dept_number
 GROUP BY D.dept_name
 HAVING AVG(E.emp_salary)<90000;

#QUESTION 8 #join this two tables
SELECT emp_first_name, emp_last_name
FROM EMPLOYEE
WHERE dept_number IN 
(
select dept_number
from EMPLOYEE 
where emp_salary in
(SELECT MAX(emp_salary) FROM EMPLOYEE)
)
GROUP BY emp_first_name, emp_last_name;

# QUESTION 9 
SELECT emp_first_name, emp_last_name
FROM EMPLOYEE 
WHERE emp_salary IN
(Select emp_salary FROM EMPLOYEE
WHERE emp_salary >= (Select MIN(emp_salary) FROM EMPLOYEE)+20000)
GROUP BY emp_first_name, emp_last_name;

#OR
SELECT emp_first_name, emp_last_name
FROM EMPLOYEE 
WHERE emp_salary >= any
(Select min(emp_salary)+20000 FROM EMPLOYEE);

#QUESTION 10
SELECT emp_sin, COUNT(*) AS NumberOfProjects
FROM WORKSON
GROUP BY emp_sin
HAVING COUNT(*)>2
ORDER BY NumberOfProjects desc;

#QUESTION 11
SELECT E.emp_first_name, E.emp_last_name, D.depend_name
FROM EMPLOYEE AS E
			LEFT OUTER JOIN
			DEPENDENT AS D
            ON
            E.emp_sin = D.emp_sin; 
            
#QUESTION 12 
SELECT W.prj_number, count(*) AS NumberOfEmployees
FROM WORKSON AS W
group by W.working_hours,W.prj_number
HAVING COUNT(*)>1;
