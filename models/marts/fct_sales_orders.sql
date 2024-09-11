with
    dim_customers as (
        select *
        from {{ ref('dim_customers') }}
    )

    , dim_products as (
        select *
        from {{ ref('dim_products') }}
    )

    , dim_regions as (
        select *
        from {{ ref('dim_regions') }}
    )

    , dim_sales_reasons as (
        select *
        from {{ ref('dim_sales_reasons') }}
    )
    
    , stg_sales_orders as (
        select
           *
            , case
                when fk_credit_card is null then 'Others'
                when fk_credit_card is not null then 'Credit Card'
            end as payment_method
        from {{ ref('stg_erp__orders') }}
    )

    , stg_sales_order_details as (
        select *
        from {{ ref('stg_erp__order_details') }}
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
        left join dim_sales_reasons as reasons
            on details.fk_sales_order = reasons.fk_sales_order
    )

    , metrics as (
        select
            *
            , cast(quantity * unit_price as numeric(18,2)) as gross_sales
            , cast(quantity * (1 - discount) * unit_price as numeric(18,2)) as net_sales
            , cast(tax / count(*) over(partition by fk_sales_order) as numeric(18,2)) as prorated_tax
            , cast(freight / count(*) over(partition by fk_sales_order) as numeric(18,2)) as prorated_freight
        from joined
    )

    , surrogate_key as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'fk_sales_order'
                , 'fk_product'
            ]) }} as sk_sales
            , *
        from metrics
    )

    , reordered as (
        select
            sk_sales
            , fk_sales_order
            , fk_product
            , fk_customer
            , fk_sales_person
            , fk_ship_address
            , dt_order
            , quantity
            , unit_price
            , discount
            , prorated_tax
            , prorated_freight
            , gross_sales
            , net_sales
            , order_status
            , payment_method
            , reason_name
            , is_online_order
        from surrogate_key
    )

select *
from reordered