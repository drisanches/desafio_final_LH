with
    fct_sales as (
        select *
        from {{ ref('fct_sales_orders') }}
        where order_status = 'Shipped'
    )

    , dim_customers as (
        select *
        from {{ ref('dim_customers') }}
    )

    , dim_regions as (
        select *
        from {{ ref('dim_regions') }}
    )

    , joined as (
        select
            sales.fk_sales_person
            , sales.fk_customer
            , sales.fk_ship_address
            , sales.fk_sales_order
            , sales.dt_order
            , sales.quantity
            , sales.gross_sales
            , sales.net_sales
            , customers.store_name
            , customers.customer_name as seller_name
            , regions.city_name as city
            , regions.state_province_name as state
            , regions.country_region_name as country
        from fct_sales as sales
        left join dim_customers as customers
            on sales.fk_sales_person = customers.pk_customer
        left join dim_regions as regions
            on sales.fk_ship_address = regions.pk_address
    )

    , aggregated as (
        select
            country
            , state
            , city
            , seller_name
            , count(distinct fk_sales_order) as total_orders
            , sum(gross_sales) as total_gross_sales
            , sum(net_sales) as total_net_sales
            , sum(quantity) as total_quantity
        from joined
        group by 
            city
            , state
            , country
            , seller_name
        order by 
            country
            , seller_name
    )

select *
from aggregated