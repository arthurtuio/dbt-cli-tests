
    
    



select count(*) as validation_errors
from (

    select
        id

    from "dev"."jaffle_shop"."orders"
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


