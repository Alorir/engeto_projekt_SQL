SELECT 
    a.obs_year AS Year,
    AVG(a.price) AS avg_price,
    AVG(a.salary) AS avg_salary,
    b.gdp AS gdp,
    AVG(a.price) - LAG(AVG(a.price)) OVER (ORDER BY a.obs_year) AS price_change,
    AVG(a.salary) - LAG(AVG(a.salary)) OVER (ORDER BY a.obs_year) AS salary_change,
    b.gdp - LAG(b.gdp) OVER (ORDER BY a.obs_year) AS gdp_change
FROM 
    t_alena_kurkova_project_sql_primary_final AS a
JOIN 
    t_alena_kurkova_project_sql_secondary_final AS b ON a.obs_year = b.obs_year
WHERE 
    b.country = 'Czech Republic' 
GROUP BY 
    a.obs_year, b.gdp
ORDER BY 
    a.obs_year;
