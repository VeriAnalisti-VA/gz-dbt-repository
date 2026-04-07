SELECT
    products_id,
    SAFE_CAST(purchase_price AS FLOAT64) AS purchase_price
FROM {{ source('raw' , 'product') }}