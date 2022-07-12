with source_data as (
    select
        addressid
        ,stateprovinceid				
        ,city	
       		
 			
    from {{ source('advwks', 'person_address') }}
)

select *
from source_data