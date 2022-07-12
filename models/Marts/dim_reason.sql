with sos as (
    select *
    from {{ref('stg_salesorderheadsalesreason')}}
),

reason as (
    select *
    from {{ref('stg_salesreason')}}
),


 transformed as (
    select
        row_number() over (order by sos.order_sales_id) as reason_sk -- auto-incremental surrogate key
        , sos.order_sales_id
        , sos.salesreasonid
        , reason.reason_name
        , reason.reasontype

    from sos

    
    JOIN reason ON sos.salesreasonid = reason.salesreasonid
  

)

select * 
from transformed