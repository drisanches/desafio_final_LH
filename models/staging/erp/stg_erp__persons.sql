with
    renamed as (
        select
            cast(businessentityid as int) as pk_business_entity
            , cast(persontype as varchar) as person_type
            , cast(namestyle as varchar) as name_style
            , cast(firstname as varchar) as first_name
            , cast(middlename as varchar) as middle_name
            , cast(lastname as varchar) as last_name
            --, title
            --, suffix
            --, emailpromotion
            --, additionalcontactinfo
            --, demographics
            --, rowguid
            --, modifieddate
        from {{ source('erp', 'person') }}
    )

select *
from renamed
