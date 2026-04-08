with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        --shipping_fee_1,
        logcost,
        SAFE_CAST(ship_cost as float64) as ship_cost
       -- CASE 
        -- WHEN shipping_fee = shipping_fee_1 THEN '0'
        -- ELSE '1'
       -- END AS fee_comparison_check,

    from source


)
--filter as (
    --select * from renamed
    --where fee_comparison_check = '1')
--select * from filter
select * from renamed