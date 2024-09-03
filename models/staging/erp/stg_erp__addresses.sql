with
    renamed as (
        select
            cast(addressid as int) as pk_address
            , cast(stateprovinceid as int) as fk_state_province
            , cast(city as varchar) as city_name
            --, addressline1
            --, addressline2
            --, postalcode
            --, spatiallocation
            --, rowguid
            --, modifieddate
        from {{ source('erp', 'address') }}
    )

select *
from renamed
