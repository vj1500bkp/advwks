with source_data as (
    select
        salesreasonid
        ,salesreason.name as reason_name
        ,reasontype
               		
    from {{ source('advwks', 'salesreason') }}
)

select *
from source_data