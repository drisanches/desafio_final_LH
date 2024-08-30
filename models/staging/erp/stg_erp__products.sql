with
    renamed as (
        select *
        from {{ source('erp', 'product') }}
    )
select *
from renamed