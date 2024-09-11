with
    stg_sales_reasons as (
        select *
        from {{ ref('stg_erp__sales_reasons') }}
    )

    -- Fixing duplicate orders with different sale reasons
    , stg_sales_orders_reasons as (
        select
            fk_sales_order
            , fk_sales_reason
            , row_number() over (
                partition by fk_sales_order
                order by modified_date desc
            ) as row_num
        from {{ ref('stg_erp__sales_orders_reasons') }}
    )

    , filtered as (
        select
            fk_sales_order
            , fk_sales_reason
        from stg_sales_orders_reasons
        where row_num = 1
    )

    , joined as (
        select
            orders_reasons.fk_sales_order
            , reasons.reason_name
        from filtered as orders_reasons
        left join stg_sales_reasons as reasons
            on orders_reasons.fk_sales_reason = reasons.pk_sales_reason
    )

select *
from joined
