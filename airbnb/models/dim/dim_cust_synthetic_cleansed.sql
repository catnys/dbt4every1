{{
    config(materialized = 'view')
}}

WITH src_cust_synthetic AS (
    SELECT * FROM {{ ref('src_cust_synthetic') }}
)

SELECT customer_id,
       first_name || ' ' || last_name AS full_name,
       NVL(email, 'Unknown') AS email,
       LOWER(customer_status) AS customer_status,
       created_at,
       updated_at
FROM src_cust_synthetic