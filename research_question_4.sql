WITH yearly_average AS (
    SELECT 
        obs_year,
        AVG(price) AS avg_price
    FROM 
        t_alena_kurkova_project_sql_primary_final
    GROUP BY 
        obs_year
),
wage_growth AS (
    SELECT 
        obs_year,
        AVG(salary) AS avg_salary
    FROM 
        t_alena_kurkova_project_sql_primary_final
    GROUP BY 
        obs_year
),
price_change_percentage AS (
    SELECT 
        obs_year,
        avg_price,
        (avg_price / LAG(avg_price, 1) OVER (ORDER BY obs_year) - 1) * 100 AS percentage_change_price
    FROM 
        yearly_average
),
wage_change_percentage AS (
    SELECT 
        obs_year,
        avg_salary,
        (avg_salary / LAG(avg_salary, 1) OVER (ORDER BY obs_year) - 1) * 100 AS percentage_change_salary
    FROM 
        wage_growth
)
SELECT 
    pcp.obs_year,
    pcp.avg_price AS average_price,
    wcp.avg_salary AS average_salary,
    pcp.percentage_change_price AS price_change_percentage,
    wcp.percentage_change_salary AS salary_change_percentage
FROM 
    price_change_percentage pcp
JOIN 
    wage_change_percentage wcp ON pcp.obs_year = wcp.obs_year
WHERE 
    pcp.percentage_change_price > (wcp.percentage_change_salary + 10);