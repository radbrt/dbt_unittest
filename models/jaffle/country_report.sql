WITH customers AS (
  SELECT * FROM {{ ref('seed_customers') }}
),
countries AS (
  SELECT * FROM {{ ref('seed_countries') }}
),
countries_customers AS (
  SELECT
    countries.name AS country_name,
    customers.name AS customer_name
  FROM countries
  JOIN customers ON countries.name = customers.country
),
country_report AS (
  SELECT country_name, 
  COUNT(*) AS customer_count 
  FROM countries_customers 
  GROUP BY country_name
)
SELECT * FROM country_report