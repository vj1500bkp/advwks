with
 card as (
    select
        *
    from {{ref('dim_creditcard')}}
),

 detail as (
    select
   *
    from {{ref('dim_order_detail')}}
)

, customer as (
    select
     *
    from {{ref('dim_person_customer')}}
),

 territory as (
    select
*
    from {{ref('dim_sales_territory')}}
),

 reason as (
    select
*
    from {{ref('dim_reason')}}
),


 fct as (
    select
     card.card_sk
     ,detail.detail_sk
     ,customer.customer_sk
     ,territory.territory_sk
     ,reason.reason_sk
     ,orders.salesorderid
     ,orders.orderdate
     ,orders.order_status
     ,orders.customerid
     ,orders.territoryid
     ,orders.creditcardid
     ,orders.billtoaddressid
    from {{ref('stg_sales_salesorderheader')}} orders


    left join card on card.creditcardid = orders.creditcardid
    left join detail on detail.salesorderid = orders.salesorderid
    left join customer on customer.customerid = orders.customerid
    left join territory on territory.addressid = orders.billtoaddressid
    left join reason on reason.order_sales_id = orders.salesorderid


)


select * from fct