with
    stg_product_categories as (
        select *
        from {{ ref('stg_erp__product_categories') }}
    )

    , stg_product_subcategories as (
        select *
        from {{ ref('stg_erp__product_subcategories') }}
    )

    , stg_products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

    , joined as (
        select
           products.pk_product
            , products.product_name
            , categories.category_name
            , subcategories.subcategory_name
            , products.is_purchased
            , products.product_cost
            , products.list_price
            , products.days_to_manufacture
            , products.product_line
            , products.product_class
            , products.product_style
        from stg_products as products
        left join stg_product_subcategories as subcategories
            on products.fk_product_subcategory = subcategories.pk_product_subcategory
        left join stg_product_categories as categories
            on categories.pk_product_category = subcategories.fk_product_category
        where products.is_salable = true
    )

select *
from joined