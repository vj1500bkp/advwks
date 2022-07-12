with source_data as (
    select
        creditcardid
        ,cardtype		
               		
 			
    from {{ source('advwks', 'salescreditcard') }}
)

select *
from source_data