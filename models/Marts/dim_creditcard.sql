with card as (
    select *
    from {{ref('stg_salescreditcard')}}
),

 transformed as (
    select
        row_number() over (order by card.creditcardid) as card_sk -- auto-incremental surrogate key
        , card.creditcardid
        , cardtype
 


    from card   
 

)

select * 
from transformed