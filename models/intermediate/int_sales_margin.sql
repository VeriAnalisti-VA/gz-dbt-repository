SELECT
    s.products_id,
    ROUND(SUM(s.revenue),2) AS total_revenue,
    ROUND(SUM(s.quantity * p.purchase_price),2) AS total_cost_of_goods,
    ROUND(SUM(sh.logcost),2) AS total_log_cost,
    ROUND(SUM(sh.ship_cost),2) AS total_ship_cost,
    ROUND(SUM(s.revenue - (s.quantity * p.purchase_price) - sh.logcost - sh.ship_cost),2) AS total_margin,
    ROUND(SAFE_DIVIDE(SUM(s.revenue - (s.quantity * p.purchase_price) - sh.logcost - sh.ship_cost), SUM(s.quantity)),2) AS margin_per_unit
FROM {{ ref('stg_raw__sales') }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p 
    ON s.products_id = p.products_id
LEFT JOIN {{ ref('stg_raw__ship') }} AS sh 
    ON s.orders_id = sh.orders_id
GROUP BY 1
ORDER BY total_margin DESC