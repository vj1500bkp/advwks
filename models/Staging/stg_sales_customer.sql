with source_data as (
    select
        customerid
        ,personid		
        ,territoryid	
       		
 			
    from {{ source('advwks', 'sales_customer') }}
)

select *
from source_data