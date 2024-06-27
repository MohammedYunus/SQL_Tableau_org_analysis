with T1 as (SELECT 
    calendar_year,
    DM.dept_no,
    D.dept_name,
    E.gender,
    COUNT(DM.emp_no) AS num_of_mng
FROM
    (SELECT 
        *,
            CASE
                WHEN calendar_year BETWEEN YEAR(from_date) AND YEAR(to_date) THEN 1
                ELSE 0
            END AS active_manager
    FROM
        t_dept_manager
    CROSS JOIN (SELECT DISTINCT
        YEAR(from_date) AS calendar_year
    FROM
        t_dept_manager
    ORDER BY calendar_year) years) DM
        JOIN
    t_departments D ON DM.dept_no = D.dept_no
        JOIN
    t_employees E ON DM.emp_no = E.emp_no
WHERE
    active_manager = 1
GROUP BY calendar_year , dept_name, E.gender
order by calendar_year, dept_name)

Select calendar_year,
    t1.dept_name,
    sum(case
		when gender='M' and num_of_mng > 0 then num_of_mng
        else 0
    end) AS male,
    sum(case
		when gender='F' and num_of_mng > 0 then num_of_mng
        else 0
    end) AS female
from t_departments dep
left join T1 on dep.dept_no = T1.dept_no
group by calendar_year, t1.dept_name
ORDER BY calendar_year;





    
    
    
    
    
    
    
    