SELECT
    products_id,
    SAFE_CAST(purchSE_PRICE AS FLOAT64) AS purchase_price
FROM {{ source('raw' , 'product') }}