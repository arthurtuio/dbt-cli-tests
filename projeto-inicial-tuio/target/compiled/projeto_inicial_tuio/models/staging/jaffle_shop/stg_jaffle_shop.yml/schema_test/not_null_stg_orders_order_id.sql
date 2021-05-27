
    
    



select count(*) as validation_errors
from "dev"."public"."stg_orders"
where order_id is null


