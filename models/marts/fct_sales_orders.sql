with
    stg_sales_orders as (
        select
            pk_sales_order
            , fk_customer
            , fk_sales_person
            , fk_ship_address
            , dt_order
            , tax
            , freight
            , order_status
            , case
                when fk_credit_card is null then 'Others'
                when fk_credit_card is not null then 'Credit Card'
            end as payment_method
            , is_online_order
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
            , orders.order_status
            , orders.payment_method
            , case
                when reasons.reason_name is not null then reasons.reason_name
                when reasons.reason_name is null then 'Not Informed'
            end as reason_name
            , orders.is_online_order
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