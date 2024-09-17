with
    fct_sales as (
        select *
        from {{ ref('fct_sales_orders') }}
    )

    , stg_sales_persons as (
        select
            pk_person
            , concat(first_name,
                coalesce(concat(' ', trim(middle_name)), ''),
                ' ',
                last_name) as person_name
        from {{ ref('stg_erp__persons') }}
        where person_type = 'Seller'
    )

    , dim_regions as (
        select *
        from {{ ref('dim_regions') }}
    )

    , joined as (
        select
            sales.fk_sales_order
            , sales.fk_sales_person
            , sales.fk_ship_address
            , year(sales.dt_order) as order_year
            , sales.quantity
            , sales.gross_sales
            , sales.net_sales
            , case
                when customers.person_name is null then 'No Seller'
                else customers.person_name
            end as seller_name
            , regions.country_region_name as country
        from fct_sales as sales
        left join stg_sales_persons as customers
            on sales.fk_sales_person = customers.pk_person
        left join dim_regions as regions
            on sales.fk_ship_address = regions.pk_address
    )

    , aggregated as (
        select
            seller_name
            , order_year
            , country
            , count(distinct fk_sales_order) as total_orders
            , sum(gross_sales) as total_gross_sales
            , sum(net_sales) as total_net_sales
            , sum(quantity) as total_quantity
        from joined
        group by 
            seller_name
            , order_year
            , country
        order by 
            seller_name
            , order_year
    )

select *
from aggregated