

  create view "dev"."public"."stg_orders__dbt_tmp" as (
    select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from jaffle_shop.orders
  ) ;
