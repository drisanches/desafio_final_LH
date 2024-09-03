with
    stg_customers as (
        select *
        from {{ ref('stg_erp__customers') }}
    )

    , stg_persons as (
        select
            pk_business_entity
            , person_type
            , concat(first_name, ' ', coalesce(middle_name, ''), ' ', last_name) as customer_name
        from {{ ref('stg_erp__persons') }}
    )

    , stg_stores as (
        select *
        from {{ ref('stg_erp__stores') }}
    )

    , joined as (
        select
            customers.pk_customer
            , persons.pk_business_entity
            , stores.pk_store_business_entity
            , persons.person_type
            , persons.customer_name
            , stores.store_name
        from stg_customers as customers
        left join stg_persons as persons
            on customers.fk_person = persons.pk_business_entity
        left join stg_stores as stores
            on customers.fk_store = stores.pk_store_business_entity
    )

select *
from joined