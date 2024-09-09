with
    stg_addresses as (
        select *
        from {{ ref('stg_erp__addresses') }}
    )

    , stg_states_provinces as (
        select *
        from {{ ref('stg_erp__states_provinces') }}
    )

    , stg_countries_regions as (
        select *
        from {{ ref('stg_erp__countries_regions') }}
    )

    , joined as (
        select
            addresses.pk_address
            , addresses.city_name
            , states.state_province_code
            , states.state_province_name
            , countries.country_region_name
        from stg_addresses as addresses
        left join stg_states_provinces as states
            on addresses.fk_state_province = states.pk_state_province
        left join stg_countries_regions as countries
            on states.fk_country_region = countries.pk_country_region
    )

select *
from joined