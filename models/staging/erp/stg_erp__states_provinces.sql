with
    renamed as (
        select
            cast(stateprovinceid as int) as pk_state_province
            , cast(countryregioncode as varchar) as fk_country_region
            , cast(territoryid as int) as fk_territory
            , cast(stateprovincecode as varchar) as state_province_code
            , cast(name as varchar) as state_province_name
            , cast(isonlystateprovinceflag as boolean) as is_only_state_province
            --, rowguid
            --, modifieddate
        from {{ source('erp', 'stateprovince') }}
    )

select *
from renamed
