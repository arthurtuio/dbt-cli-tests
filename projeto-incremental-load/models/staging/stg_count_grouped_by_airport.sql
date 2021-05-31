select
    airportname,
    count(*) as rows_count
from {{ source('kaggle_covid_airport', 'covid_impact_on_airport_traffic') }}
where "version" = '1.0' and aggregationmethod = 'Daily'
group by 1
