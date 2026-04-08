WITH orders_summary AS (
    SELECT
        orders_id,
        MAX(date_date) AS date_date,
        SUM(total_revenue) AS total_revenue,
        SUM(total_quantity) AS total_quantity,
        SUM(total_cost_of_goods) AS total_cost_of_goods,
        SUM(total_margin) AS total_margin
    FROM {{ ref('int_sales_margin') }}
    GROUP BY 1
)
SELECT
    o.orders_id,
    o.date_date,
    o.total_revenue,
    o.total_quantity,
    o.total_cost_of_goods,
    o.total_margin,
    sh.shipping_fee,
    sh.logcost,
    CAST(sh.ship_cost AS FLOAT64) AS ship_cost,
    ROUND(o.total_margin + sh.shipping_fee - sh.logcost - CAST(sh.ship_cost AS FLOAT64), 2) AS operational_margin
FROM orders_summary AS o
LEFT JOIN {{ ref('stg_raw__ship') }} AS sh 
    ON o.orders_id = sh.orders_id