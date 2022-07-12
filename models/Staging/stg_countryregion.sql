with source_data as (
    select
        countryregioncode				
        , person_countryregion.name as countryregionname 	
       		
 			
    from {{ source('advwks', 'person_countryregion') }}
)

select *
from source_data