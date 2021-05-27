

  create view "dev"."public"."my_first_dbt_model__dbt_tmp" as (
    select id, order_id from stripe.payment
  ) ;
