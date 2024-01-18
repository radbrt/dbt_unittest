WITH source AS
(
  SELECT ix*2 as ix2, upper(name) AS name FROM {{ ref('seed_customers') }}
)
SELECT * FROM source