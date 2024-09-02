with
    renamed as (
        select
           cast(productcategoryid as int) as pk_product_category
           , cast(name as varchar) as category_name
           --, rowguid
           --, modifieddate
        from {{ source('erp', 'productcategory') }}
    )

select *
from renamed