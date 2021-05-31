select airportname, count(*)
from kaggle_covid_airport.covid_impact_on_airport_traffic
where "version" = '1.0'
group by 1
