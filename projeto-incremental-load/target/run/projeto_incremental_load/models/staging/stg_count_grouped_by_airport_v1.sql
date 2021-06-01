

  create view "dev"."kaggle_covid_airport"."stg_count_grouped_by_airport_v1__dbt_tmp" as (
    select airportname, count(*)
from kaggle_covid_airport.covid_impact_on_airport_traffic
where "version" = '1.0'
group by 1
  ) ;
