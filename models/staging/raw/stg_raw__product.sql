with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        products_id,
        SAFE_CASE(purchse_price, float64) as purchase_price

    from source

)

select * from renamed