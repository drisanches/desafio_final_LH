with
    renamed as (
        select *
            , cast(salesorderdetailid as int) as pk_order_detail
            , cast(salesorderid as int) as fk_sales_order
            , cast(productid as int) as fk_product
            , cast(orderqty as int) as quantity
            , cast(unitprice as numeric(18,2)) as unit_price
            , cast(unitpricediscount as numeric(18,2)) as discount
            , cast(linetotal as numeric(18,2)) as subtotal
            --, specialofferid
            --, carriertrackingnumber
            --, rowguid
            --, modifieddate
        from {{ source('erp', 'salesorderdetail') }}
    )

select *
from renamed
