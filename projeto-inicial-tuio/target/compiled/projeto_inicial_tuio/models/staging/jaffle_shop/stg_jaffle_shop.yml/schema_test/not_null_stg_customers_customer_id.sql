
    
    



select count(*) as validation_errors
from "dev"."public"."stg_customers"
where customer_id is null


