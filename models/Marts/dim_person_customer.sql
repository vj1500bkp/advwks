with customer as (
    select *
    from {{ref('stg_sales_customer')}}
),

person as (
    select *
    from {{ref('stg_person_person')}}
),


 transformed as (
    select
        row_number() over (order by customer.customerid) as customer_sk -- auto-incremental surrogate key
        , customer.customerid
        , customer.personid
        , customer.territoryid
        , person.businessentityid
        , person.firstname
        , person.lastname


    from customer

    
    JOIN person ON person.businessentityid = customer.customerid
  

)

select * 
from transformed