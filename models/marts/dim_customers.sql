with
    stg_customers as (
        select *
        from {{ ref('stg_erp__customers') }}
    )

    , stg_persons as (
        select
            pk_person
            , person_type
            , concat(first_name,
                coalesce(concat(' ', trim(middle_name)), ''),
                ' ',
                last_name) as customer_name
        from {{ ref('stg_erp__persons') }}
    )

    , stg_stores as (
        select *
        from {{ ref('stg_erp__stores') }}
    )

    , joined as (
        select
            customers.pk_customer
            , persons.pk_person
            , stores.pk_store
            , persons.customer_name
            , stores.store_name
            , case
                when persons.person_type is not null then persons.person_type
                when persons.person_type is null then 'Store'
            end as person_type
        from stg_customers as customers
        left join stg_persons as persons
            on customers.fk_person = persons.pk_person
        left join stg_stores as stores
            on customers.fk_store = stores.pk_store
    )

select *
from joined