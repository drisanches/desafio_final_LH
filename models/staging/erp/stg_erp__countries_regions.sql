with
    renamed as (
        select
            cast(countryregioncode as varchar) as pk_country_region
            , cast(name as varchar) as country_region_name
            --, modifieddate
        from {{ source('erp', 'countryregion') }}
    )

select *
from renamed
