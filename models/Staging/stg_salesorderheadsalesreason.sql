with source_data as (
    select
        salesorderheadsalesreason.salesorderid as order_sales_id
        ,salesreasonid
               		
    from {{ source('advwks', 'salesorderheadsalesreason') }}
)

select *
from source_data