with
    renamed as (
        select
            cast(businessentityid as int) as pk_store_business_entity
            , cast(salespersonid as int) as fk_sales_person
            , cast(name as varchar) as store_name
            --, demographics
            --, rowguid
            --, modifieddate
        from {{ source('erp', 'store') }}
    )

select *
from renamed
