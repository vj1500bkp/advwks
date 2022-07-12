with source_data as (
    select
        salesorderid
        ,orderdate		
        ,sales_salesorderheader.status as order_status
        ,billtoaddressid
        ,customerid
        ,territoryid
        ,creditcardid	
       		
 			
    from {{ source('advwks', 'sales_salesorderheader') }}
)

select *
from source_data