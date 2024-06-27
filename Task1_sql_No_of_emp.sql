desc t_dept_emp;

SELECT 
    gender, YEAR(from_date) AS calendar_year, COUNT(E.emp_no) AS num_of_employees
FROM
    t_employees E
        JOIN
    t_dept_emp DE ON E.emp_no = DE.emp_no
GROUP BY calendar_year , gender
HAVING calendar_year >= '1990'
ORDER BY calendar_year;

