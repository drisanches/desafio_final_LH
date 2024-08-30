with
    renamed as (
        select
            cast(productid as int) as pk_product
            , cast(productsubcategoryid as int) as fk_product_subcategory
            , cast(name as varchar) as product_name
            , cast(makeflag as boolean) as is_purchased
            , cast(finishedgoodsflag as boolean) as is_salable
            , cast(standardcost as float) as product_cost
            , cast(listprice as float) as list_price
            , cast(daystomanufacture as int) as days_to_manufacture
            , cast(productline as varchar) as product_line
            , cast(class as varchar) as product_class
            , cast(style as varchar) as product_style
            --, color
            --, productmodelid
            --, productnumber
            --, size
            --, sizeunitmeasurecode
            --, weightunitmeasurecode
            --, weight
            --, safetystocklevel
            --, reorderpoint
            --, sellstartdate
            --, sellenddate
            --, discontinueddate
            --, rowguid
            --, modifieddate
        from {{ source('erp', 'product') }}
    )

select *
from renamed