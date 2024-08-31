with
    renamed as (
        select
           cast(productsubcategoryid as int) as pk_product_subcategory
           , cast(name as varchar) as subcategory_name
           --, rowguid
           --, modifieddate
        from {{ source('erp', 'productsubcategory') }}
    )

select *
from renamed