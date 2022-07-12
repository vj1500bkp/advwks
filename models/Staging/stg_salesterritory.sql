with source_data as (
    select
        territoryID

    from {{ source('advwks', 'salesterritory') }}
)

select *
from source_data