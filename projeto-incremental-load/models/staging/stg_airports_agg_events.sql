select
	airportname,
    max(cast("date" as date)) as max_date,
    min(cast("date" as date)) as min_date
from {{ source('kaggle_covid_airport', 'covid_impact_on_airport_traffic') }}
group by 1
