 {{ config(materialized='table') }}
SELECT
    date_date AS tarih,
    COUNT(DISTINCT orders_id) AS toplam_islem_sayisi,
    ROUND(SUM(total_revenue), 2) AS toplam_gelir,
    ROUND(SAFE_DIVIDE(SUM(total_revenue), COUNT(DISTINCT orders_id)), 2) AS ortalama_sepet_degeri,
    ROUND(SUM(operational_margin), 2) AS toplam_operasyonel_marj,
    ROUND(SUM(total_cost_of_goods), 2) AS toplam_satinalma_maliyeti,
    ROUND(SUM(shipping_fee), 2) AS toplam_nakliye_ucretleri,
    ROUND(SUM(logcost), 2) AS toplam_lojistik_maliyetleri,
    SUM(total_quantity) AS satilan_toplam_urun_miktari
FROM {{ ref('int_orders_operational') }}
GROUP BY
    date_date
ORDER BY
    date_date DESC