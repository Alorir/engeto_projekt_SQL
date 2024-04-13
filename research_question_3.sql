WITH yearly_price_change AS (
    SELECT 
        name,
        obs_year,
        AVG(price) AS avg_price
    FROM 
        t_alena_kurkova_project_sql_primary_final
    GROUP BY 
        name, obs_year
),
price_change_percentage AS (
    SELECT 
        name,
        obs_year,
        avg_price,
        (avg_price / LAG(avg_price, 1) OVER (PARTITION BY name ORDER BY obs_year) - 1) * 100 AS percentage_change
    FROM 
        yearly_price_change
),
slowest_price_increase AS (
    SELECT 
        name,
        AVG(percentage_change) AS avg_percentage_change
    FROM 
        price_change_percentage
    WHERE 
        percentage_change IS NOT NULL
    GROUP BY 
        name
    ORDER BY 
        avg_percentage_change ASC
    LIMIT 1
)
SELECT 
    name AS food_category,
    avg_percentage_change AS average_percentage_increase
FROM 
    slowest_price_increase;
   
   
