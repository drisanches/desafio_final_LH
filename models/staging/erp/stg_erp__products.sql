with
    renamed as (
        select
            cast(productid as int) as pk_product
            , cast(productsubcategoryid as int) as fk_product_subcategory
            , cast(name as varchar) as product_name
            , cast(makeflag as boolean) as is_manufactured
            , cast(finishedgoodsflag as boolean) as is_salable
            , cast(standardcost as numeric(18,2)) as product_cost
            , cast(listprice as numeric(18,2)) as list_price
            , cast(daystomanufacture as int) as days_to_manufacture
            , cast(case
                when trim(productline) = 'R' then 'Road'
                when trim(productline) = 'M' then 'Mountain'
                when trim(productline) = 'T' then 'Touring'
                when trim(productline) = 'S' then 'Standard'
                else null
            end as varchar) as product_line
            , cast(case
                when trim(class) = 'H' then 'High'
                when trim(class) = 'M' then 'Medium'
                when trim(class) = 'L' then 'Low'
                else null
            end as varchar) as product_class
            , cast(case
                when trim(style) = 'W' then 'Womens'
                when trim(style) = 'M' then 'Mens'
                when trim(style) = 'U' then 'Universal'
                else null
            end as varchar) as product_style
            --, productnumber
            --, color
            --, safetystocklevel
            --, reorderpoint
            --, size
            --, sizeunitmeasurecode
            --, weightunitmeasurecode
            --, weight
            --, productmodelid
            --, sellstartdate
            --, sellenddate
            --, discontinueddate
            --, rowguid
            --, modifieddate
        from {{ source('erp', 'product') }}
    )

select *
from renamed
