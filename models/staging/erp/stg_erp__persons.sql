with
    renamed as (
        select
            cast(businessentityid as int) as pk_person
            , cast(case
                when trim(persontype) = 'SC' then 'Store Contact'
                when trim(persontype) = 'IN' then 'Individual'
                when trim(persontype) = 'SP' then 'Seller'
                when trim(persontype) = 'EM' then 'Employee'
                when trim(persontype) = 'VC' then 'Vendor'
                when trim(persontype) = 'GC' then 'General'
                else null
            end as varchar) as person_type
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
