/*1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"*/

select first_name as "First Name", last_name as "Last Name" from employees;

 /*2. Write a query to get unique department ID from employee table.*/
 
select distinct(department_id) from employees;

 /*3. Write a query to get all employee details from the employee table order by first name, descending.*/
 
select * from employees
order by first_name desc;

/*4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).*/

select first_name, last_name, salary, round(salary*0.15, 2) as PF  from employees;

select concat(first_name, " ", last_name) as "Full Name", salary, round(salary*0.15,2) as PF from employees;

 /*5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.*/

select Employee_Id, concat(first_name," ", last_name) as Name, salary from employees
order by salary asc;

 /*6. Write a query to get the total salaries payable to employees.*/
 
select sum(salary) as "Total Salaries Payable"from employees;

/*7. Write a query to get the average salary and number of employees in the employees table.*/

select round(avg(salary),2) as "Average Salary" ,count(employee_id) as Total_employees from employees;

/* 9. Write a query to get the number of employees working with the company.*/

select count(*) as "Total Employees" from employees;

/*10. Write a query to get the number of jobs available in the employees table. */

select count(distinct (job_id)) as Jobs_Available from employees;

/*11. Write a query get all first name from employees table in upper case.*/

select upper(first_name) as "First Name" from employees;

/*12. Write a query to get the first 3 characters of first name from employees table.*/

select first_name, substring(first_name, 1,3) as 3Words from employees;

/*13. Write a query to calculate 171*214+625.*/

select 171*214+625 as Calculation;

/*14. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.*/

select concat(first_name," ", last_name) as Names from employees;


/*15. Write a query to get first name from employees table after removing white spaces from both side.*/

select trim(first_name) as First_Names from employees;

/*16. Write a query to get the length of the employee names (first_name, last_name) from employees table.*/

select first_name, last_name, length(first_name)+ length(last_name) as "Length of Characters" from employees;

/*17. Write a query to check if the first_name fields of the employees table contains numbers. */

select first_name from employees
where first_name regexp '[0-9]';

/*18. Write a query to select first 10 records from a table.*/

select * from employees
limit 10;

/*19. Write a query to get monthly salary (round 2 decimal places) of each and every employee Go to the editor
Note : Assume that the salary field provides the 'annual salary' information.*/

select first_name, last_name, round(salary/12, 2) as Monthly_Salary from employees;

/*20. Write a query to display the name (first_name, last_name) and
 salary for all employees whose salary is not in the range $10,000 through $15,000.*/
 
select first_name,last_name,salary from employees
where  salary  not between 10000 and 15000;

 /*21. Write a query to display the name (first_name, last_name) and
 department ID of all employees in departments 30 or 100 in ascending order.*/
 
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (30, 100)
ORDER BY department_id ASC;

 /*22. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in 
 the range $10,000 through $15,000 and are in department 30 or 100.*/
 
 select DEPARTMENT_ID, first_name, last_name, salary from employees
 where salary not between 10000 and 15000 and
 DEPARTMENT_ID in (30, 100);

 /*23.Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.*/
 
select first_name, last_name from employees
where year(hire_date) = 1987;

/* 24. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.*/

select first_name from employees
where first_name like '%b%' and  first_name like '%c%';

SELECT first_name
FROM employees
WHERE first_name REGEXP 'b.*c';

/*25. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and
 whose salary is not equal to $4,500, $10,000, or $15,000.*/
 -- note: first query is written after by exploring the employees table
 
select last_name, job_id, SALARY from employees
where JOB_ID in ('it_prog', 'sh_clerk') and salary not in (4500, 10000, 15000);

-- 2nd way:

select last_name, jobs.JOB_TITLE, salary from employees
inner join jobs on employees.JOB_ID = jobs.JOB_ID
where JOB_TITLE in ('programmer', 'shipping clerk') and
salary not in (4500, 10000, 15000);

/*26. Write a query to display the last name of employees whose names have exactly 6 characters.*/

select last_name, length(last_name) from employees
where last_name like '______';

/*27. Write a query to display the last name of employees having 'e' as the third character.*/

select last_name from employees
where last_name like '__e%';

/*28. Write a query to display the jobs/designations available in the employees table*/

select distinct job_id from employees;

/*29. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees*/

select concat(first_name," ", last_name) as Name_of_Employees, salary, round(salary*0.15,2) as PF from employees
order by salary asc;

/*30.Write a query to select all record from employees where last name in 'BLAKE','SCOTT','KING'and'FORD'*/

select * from employees
where last_name in ('blake', 'scott', 'king', 'ford');

/*31. Write a query to find the name (first_name, last_name) and 
the salary of the employees who have a higher salary than the employee whose last_name='Bull'.*/

select first_name, last_name, salary from employees
where salary > (select salary from employees where last_name ='bull')

/*32. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.*/

select first_name, last_name, departments.department_name from employees
inner join departments on employees.department_id = departments.department_id
where department_name = 'IT';

select first_name,last_name from employees
where department_id=
(select department_id from departments where department_name='IT');

/*33. Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.*/

select first_name, last_name from employees
inner join departments on employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
inner join locations on departments.LOCATION_ID = locations.LOCATION_ID
where COUNTRY_ID = 'us';

/*34. Write a query to find the name (first_name, last_name) of the employees who are managers.*/

select first_name, last_name, jobs.job_title from employees
inner join jobs on employees.JOB_ID = jobs.JOB_ID
where JOB_TITLE like '%manager%';

/*35. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.*/

select first_name, last_name, salary from employees
where salary > (select avg(salary) from employees);

/*36. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.*/

select * from employees
inner join jobs on employees.JOB_ID = jobs.JOB_ID
where SALARY = MIN_SALARY;

/* Using Subqueries*/

SELECT first_name, last_name, salary
FROM employees
WHERE salary = (
    SELECT min_salary
    FROM jobs
    WHERE jobs.job_id = employees.job_id);

/*37. Write a query to find the name (first_name, last_name), and 
salary of the employees who earns more than the average salary and works in any of the IT departments.*/

select first_name, last_name, salary from employees
inner join departments on employees.department_id = departments.department_id
where salary > (select avg(salary) from employees) and department_name = 'IT';

/*38. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.*/

select first_name, last_name, salary from employees
where salary > (select salary from employees where last_name = 'Bell')
order by SALARY asc;

/*39. Write a query to find the name (first_name, last_name), and 
salary of the employees who earn the same salary as the minimum salary for all departments.*/

SELECT first_name, last_name, salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE salary = (
    SELECT min(salary)
    FROM employees
    GROUP BY department_id
    HAVING min(salary) = salary);

/*40. Write a query to find the name (first_name, last_name), and salary of the employees 
whose salary is greater than the average salary of all departments.*/

select first_name, last_name, salary, JOB_ID from employees
where salary > all (select avg(salary) from employees );

/*41. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than 
the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
Sort the results of the salary of the lowest to highest.*/

select first_name, last_name, salary from employees
where salary > all (select salary from employees where JOB_ID = 'sh_clerk')
order by salary asc;

/*42. Write a query to find the name (first_name, last_name) of the employees who are not supervisors.*/

select first_name, last_name from employees
where EMPLOYEE_ID not in (select MANAGER_ID from employees);


/*43. Write a query to display the employee ID, first name, last name, and department names of all employees.*/

select employee_id, first_name, last_name, departments.DEPARTMENT_NAME from employees
left join departments on employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;

/*44. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is 
above average for their departments*/

select employee_id, first_name, last_name, salary from employees
where SALARY >  any (select avg(salary) from employees group by DEPARTMENT_ID);

/*45. Write a query to fetch even numbered records from employees table.*/

select * from employees
where mod(employee_id,2)=0;

/*46. Write a query to find the 5th maximum salary in the employees table*/

select distinct salary as "5th max salary" from employees
order by salary  desc limit 1 offset 4;

/*--47.Write a query to find the 4th minimum salary in the employees table.--*/

select distinct(salary) as "4th min salary" from employees
order by SALARY asc limit 1 offset 3;

/*--48.Write a query to select last 10 records from a table.--*/

select * from (select * from employees
order by EMPLOYEE_ID desc
limit 10) as tab1
order by tab1.employee_id asc;
