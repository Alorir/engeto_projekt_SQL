SELECT 
    economic_data.obs_year AS Year,
    AVG(economic_data.price) AS avg_price,
    AVG(economic_data.salary) AS avg_salary,
    country_data.gdp AS gdp,
    AVG(economic_data.price) - LAG(AVG(economic_data.price)) OVER (ORDER BY economic_data.obs_year) AS price_change,
    AVG(economic_data.salary) - LAG(AVG(economic_data.salary)) OVER (ORDER BY economic_data.obs_year) AS salary_change,
    country_data.gdp - LAG(country_data.gdp) OVER (ORDER BY economic_data.obs_year) AS gdp_change
FROM 
    t_alena_kurkova_project_sql_primary_final AS economic_data
JOIN 
    t_alena_kurkova_project_sql_secondary_final AS country_data ON economic_data.obs_year = country_data.obs_year
WHERE 
    country_data.country = 'Czech Republic' 
GROUP BY 
    economic_data.obs_year, country_data.gdp
ORDER BY 
    economic_data.obs_year;
