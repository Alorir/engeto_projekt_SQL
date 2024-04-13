CREATE TABLE t_alena_kurkova_project_sql_secondary_final AS
SELECT 	e.country,
		e.year AS obs_year, 
		e.GDP AS gdp
FROM economies e
JOIN countries c ON e.country = c.country
WHERE gdp IS NOT NULL
AND c.continent = 'Europe'
AND e.year BETWEEN 2006 AND 2018;

