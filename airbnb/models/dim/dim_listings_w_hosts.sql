WITH
cte_l AS (
    SELECT
        *
    FROM
        {{ ref('dim_listings_cleansed') }}
),
cte_h AS (
    SELECT *
    FROM {{ ref('dim_hosts_cleansed') }}
)

SELECT
    cte_l.listing_id,
    cte_l.listing_name,
    cte_l.room_type,
    cte_l.minimum_nights,
    cte_l.price,
    cte_l.host_id,
    cte_h.host_name,
    cte_h.is_superhost as host_is_superhost,
    cte_l.created_at,
    GREATEST(cte_l.updated_at, cte_h.updated_at) as updated_at
FROM cte_l
LEFT JOIN cte_h ON (cte_h.host_id = cte_l.host_id)