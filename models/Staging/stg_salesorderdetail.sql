with source_data as (
    select
        salesorderdetail.salesorderid
        ,salesorderdetailid
        ,orderqty
        ,productid
        ,unitprice		
               		
 			
    from {{ source('advwks', 'salesorderdetail') }}
)

select *
from source_data