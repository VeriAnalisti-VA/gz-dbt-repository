SELECT
  orders_id,
  MAX(date_date) AS date_date,
  ROUND(SUM(total_revenue), 2) AS total_revenue,
  ROUND(SUM(total_quantity), 2) AS total_quantity,
  ROUND(SUM(total_cost_of_goods), 2) AS purchase_cost,
  ROUND(SUM(total_margin), 2) AS margin
FROM {{ ref('int_sales_margin') }}
GROUP BY
  orders_id
ORDER BY
  orders_id DESC