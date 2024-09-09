with
    renamed as (
        select
            cast(salesreasonid as int) as pk_sales_reason
            , cast(name as varchar) as reason_name
            , cast(reasontype as varchar) as reason_type
            --, modifieddate
        from {{ source('erp', 'salesreason') }}
    )

select *
from renamed
