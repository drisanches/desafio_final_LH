with
    renamed as (
        select
            cast(salesorderid as int) as fk_sales_order
            , cast(salesreasonid as int) as fk_sales_reason
            , cast(modifieddate as date) as modified_date
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

select *
from renamed
