CREATE TABLE t_alena_kurkova_project_SQL_primary_final AS
WITH adjusted_czechia_payroll AS (
    SELECT 
        AVG(value) AS salary,
        industry_branch_code,
        payroll_year
    FROM czechia_payroll
    WHERE value IS NOT NULL
    AND industry_branch_code IS NOT NULL
    AND payroll_year BETWEEN 2006 AND 2018
    AND calculation_code = 200
    AND value_type_code = 5958
    GROUP BY industry_branch_code, payroll_year, value_type_code, unit_code, calculation_code
),
adjusted_czechia_price AS (
    SELECT 
        AVG(value) AS price,
        category_code,
        year(date_from) AS price_year
    FROM czechia_price cp
    GROUP BY category_code, price_year
)
SELECT *
FROM adjusted_czechia_payroll arp
INNER JOIN adjusted_czechia_price apr ON arp.payroll_year = apr.price_year;


ALTER TABLE t_alena_kurkova_project_sql_primary_final
MODIFY COLUMN industry_branch_code VARCHAR(255);


UPDATE t_alena_kurkova_project_sql_primary_final AS t
JOIN czechia_payroll_industry_branch AS c
ON t.industry_branch_code = c.code
SET t.industry_branch_code = c.name;


ALTER TABLE t_alena_kurkova_project_sql_primary_final
ADD COLUMN name VARCHAR(255),
ADD COLUMN price_value DECIMAL(10, 2),
ADD COLUMN price_unit VARCHAR(50);


UPDATE t_alena_kurkova_project_sql_primary_final AS t
JOIN czechia_price_category AS c
ON t.category_code = c.code
SET t.name = c.name,
    t.price_value = c.price_value,
    t.price_unit = c.price_unit;


ALTER TABLE t_alena_kurkova_project_sql_primary_final 
DROP COLUMN category_code;

ALTER TABLE t_alena_kurkova_project_sql_primary_final 
DROP COLUMN price_year;
   
ALTER TABLE t_alena_kurkova_project_sql_primary_final 
RENAME COLUMN payroll_year TO obs_year;

ALTER TABLE t_alena_kurkova_project_sql_primary_final 
RENAME COLUMN industry_branch_code TO industry_branch;


