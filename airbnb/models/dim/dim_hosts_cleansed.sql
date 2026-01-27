WITH cte_src_hosts AS (
    SELECT * FROM {{ref('src_hosts')}}  -- dbt specific jinja referral
)

SELECT
    host_id,
    NVL(host_name, 'Unknown') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    cte_src_hosts