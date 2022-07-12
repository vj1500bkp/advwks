WITH territory as (
    select *
    from {{ref('stg_person_address')}}
),

country as (
    select *
    from {{ref('stg_countryregion')}}
),

prov as (
    select *
    from {{ref('stg_stateprovince')}}
),



 transformed as (
    select
        row_number() over (order by addressid) as territory_sk -- auto-incremental surrogate key
        ,territory.addressid
        ,territory.stateprovinceid				
        ,territory.city
        ,prov.countryregioncode
        ,prov.state_name
        ,country.countryregionname 

 from territory

       JOIN prov ON prov.stateprovinceid = territory.stateprovinceid    	
       JOIN country ON country.countryregioncode = prov.countryregioncode	

   

)

select * 
from transformed