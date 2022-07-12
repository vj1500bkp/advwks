with source_data as (
    select
        stateprovinceid
        ,countryregioncode
        ,person_stateprovince.name as state_name
        ,territoryid

    from {{ source('advwks', 'person_stateprovince') }}
)

select *
from source_data