
    
    



select count(*) as validation_errors
from "dev"."kaggle_covid_airport"."covid_impact_on_airport_traffic"
where airportname is null


