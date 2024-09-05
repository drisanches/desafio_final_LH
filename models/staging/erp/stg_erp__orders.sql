with
    renamed as (
        select *
            , cast(salesorderid as int) as pk_sales_order
            , cast(customerid as int) as fk_customer
            , cast(salespersonid as int) as fk_sales_person
            , cast(shiptoaddressid as int) as fk_ship_address
            , cast(orderdate as date) as dt_order
            , cast(subtotal as numeric(18,2)) as subtotal
            , cast(taxamt as numeric(18,2)) as tax
            , cast(freight as numeric(18,2)) as freight
            , cast(totaldue as numeric(18,2)) as total_due
            , cast(case
                when status = 1 then 'In Process'
                when status = 2 then 'Approved'
                when status = 3 then 'Backordered'
                when status = 4 then 'Rejected'
                when status = 5 then 'Shipped'
                when status = 6 then 'Cancelled'
            end as varchar) as order_status
            , cast(onlineorderflag as boolean) as is_online_order
            --, salesordernumber
            --, purchaseordernumber
            --, accountnumber
            --, creditcardapprovalcode
            --, revisionnumber
            --, duedate
            --, shipdate
            --, territoryid
            --, billtoaddressid
            --, shipmethodid
            --, creditcardid
            --, currencyrateid
            --, comment
            --, rowguid
            --, modifieddate
        from {{ source('erp', 'salesorderheader') }}
    )

select *
from renamed
