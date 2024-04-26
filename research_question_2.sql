WITH first_period_price AS (
	SELECT 
		name,
		AVG(price) AS avg_price,
		obs_year
	FROM t_alena_kurkova_project_sql_primary_final takpspf 
	WHERE name IN ("Mléko polotučné pasterované", "Chléb konzumní kmínový")
	AND obs_year = 2006
	GROUP BY name, obs_year
),
last_period_price AS (
	SELECT 
		name,
		AVG(price) AS avg_price,
		obs_year
	FROM t_alena_kurkova_project_sql_primary_final
	WHERE name IN ("Mléko polotučné pasterované", "Chléb konzumní kmínový")
	AND obs_year = 2018
	GROUP BY name, obs_year
),
first_period_wage AS (
	SELECT 
		AVG(salary) AS avg_salary,
		obs_year
	FROM t_alena_kurkova_project_sql_primary_final
	WHERE obs_year = 2006
	GROUP BY obs_year
),
last_period_wage AS (
	SELECT 
		AVG(salary) AS avg_salary,
		obs_year
	FROM t_alena_kurkova_project_sql_primary_final
	WHERE obs_year = 2018
	GROUP BY obs_year)
SELECT 
    "2006" AS year,
    fpw.avg_salary AS avg_wage,
    fpp.name AS product,
    fpp.avg_price AS avg_price,
    (fpw.avg_salary / fpp.avg_price) AS quantity
FROM 
    first_period_wage fpw
JOIN 
    first_period_price fpp ON fpw.obs_year = fpp.obs_year
UNION ALL
SELECT 
    "2018" AS year,
    lpw.avg_salary AS avg_wage,
    lpp.name AS product,
    lpp.avg_price AS avg_price,
    (lpw.avg_salary / lpp.avg_price) AS quantity
FROM 
    last_period_wage lpw
JOIN 
    last_period_price lpp ON lpw.obs_year = lpp.obs_year;