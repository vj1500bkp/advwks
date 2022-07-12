with detail as (
    select *
    from {{ref('stg_salesorderdetail')}}
)

, product as (
    select *
      from {{ref('stg_production_product')}}
),

 transformed as (
    select
        row_number() over (order by detail.salesorderid) as detail_sk -- auto-incremental surrogate key
        , detail.salesorderid
        , detail.salesorderdetailid
        , detail.orderqty
        , detail.productid
        , detail.unitprice
        , product.product_name
        , product.standardcost


    from detail

    
    JOIN product ON product.productid = detail.productid

)

select * 
from transformed