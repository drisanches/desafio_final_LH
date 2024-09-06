with
    stg_sales_orders as (
        select *
        from {{ ref('stg_erp__orders') }}
    )

    , stg_sales_order_details as (
        select *
        from {{ ref('stg_erp__order_details') }}
    )

    , stg_sales_orders_reasons as (
        select *
        from {{ ref('stg_erp__sales_orders_reasons') }}
    )

    , stg_sales_reasons as (
        select *
        from {{ ref('stg_erp__sales_reasons') }}
    )

    , joined as (
        select
            details.fk_sales_order
            , details.fk_product
            , orders.fk_customer
            , orders.fk_sales_person
            , orders.fk_ship_address
            , orders.dt_order
            , details.quantity
            , details.unit_price
            , details.discount
            , orders.tax
            , orders.freight
            , reasons.reason_name
            , reasons.reason_type
        from stg_sales_order_details as details
        left join stg_sales_orders as orders
            on details.fk_sales_order = orders.pk_sales_order
        left join stg_sales_orders_reasons as orders_reasons
            on details.fk_sales_order = orders_reasons.fk_sales_order
        left join stg_sales_reasons as reasons
            on orders_reasons.fk_sales_reason = reasons.pk_sales_reason
    )

select *
from joined