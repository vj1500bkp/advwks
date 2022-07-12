with source_data as (
    select
        businessentityid
        ,firstname				
        ,lastname	
       		
 			
    from {{ source('advwks', 'person_person') }}
)

select *
from source_data