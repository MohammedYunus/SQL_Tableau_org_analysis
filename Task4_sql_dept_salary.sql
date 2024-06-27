
SELECT 
    YEAR(S.from_date) AS years,
    D.dept_name,
    gender,
    CASE
        WHEN gender = 'M' AND AVG(salary) > 0 THEN ROUND(AVG(salary), 1)
        ELSE 0
    END AS Male,
    CASE
        WHEN gender = 'F' AND AVG(salary) > 0 THEN ROUND(AVG(salary), 1)
        ELSE 0
    END AS Female,
    ROUND(AVG(salary), 2) AS Total_average_salary
FROM
    t_salaries S
        JOIN
    t_employees E ON S.emp_no = E.emp_no
        JOIN
    t_dept_emp DE ON S.emp_no = DE.emp_no
        JOIN
    t_departments D ON D.dept_no = DE.dept_no
WHERE
    YEAR(S.from_date) <= 2002
GROUP BY years , DE.dept_no , gender
ORDER BY years;