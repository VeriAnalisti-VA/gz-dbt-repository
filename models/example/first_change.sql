SELECT
    products_id,
    SAFE_CAST(purchase_price AS FLOAT64) AS purchase_price
FROM {{ ref('raw_gz_product') }}