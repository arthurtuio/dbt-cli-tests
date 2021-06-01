

  create view "dev"."kaggle_covid_airport"."stg_count_grouped_by_airport__dbt_tmp" as (
    select
    airportname,
    count(*) as rows_count
from "dev"."kaggle_covid_airport"."covid_impact_on_airport_traffic"
where "version" = '1.0' and aggregationmethod = 'Daily'
group by 1
  ) ;
