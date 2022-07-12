with source_data as (
    select
        productid
        ,production_product.name as product_name			
        ,standardcost	
       		
 			
    from {{ source('advwks', 'production_product') }}
)

select *
from source_data