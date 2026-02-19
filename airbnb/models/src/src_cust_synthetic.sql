WITH cust_synthetic AS (
    SELECT * FROM {{ source('airbnb', 'cust_synthetic') }}
)

SELECT id AS customer_id,
       UPPER(first_name) AS first_name,
       UPPER(last_name) AS last_name,
       email,
       status AS customer_status,
       created_at,
       updated_at
FROM cust_synthetic