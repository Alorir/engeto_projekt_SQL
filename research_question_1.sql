WITH avg_salaries AS (
    SELECT 
        obs_year,
        industry_branch,
        AVG(salary) AS avg_salary
    FROM 
        t_alena_kurkova_project_sql_primary_final
    GROUP BY 
        obs_year,
        industry_branch
),
salary_changes AS (
    SELECT
        a1.obs_year,
        a1.industry_branch,
        a1.avg_salary AS current_avg_salary,
        a2.avg_salary AS previous_avg_salary,
        CASE
            WHEN a1.avg_salary > a2.avg_salary THEN 'Increase'
            WHEN a1.avg_salary = a2.avg_salary THEN 'Same'
            ELSE 'Decrease'
        END AS salary_change,
        CASE
            WHEN a1.avg_salary < a2.avg_salary THEN a2.avg_salary - a1.avg_salary
            ELSE NULL
        END AS decrease_amount
    FROM avg_salaries a1
    JOIN avg_salaries a2 ON a1.industry_branch = a2.industry_branch
        AND a1.obs_year = a2.obs_year + 1
)
SELECT
    salary_change,
    industry_branch,
    obs_year,
    decrease_amount
FROM 
    salary_changes
WHERE 
    salary_change IN ('Decrease', 'Same')   
ORDER BY industry_branch;

