

  create  table
    "dev"."kaggle_covid_airport"."dim_airports__dbt_tmp"
    
    
  as (
    with registers_count as (
    select * from "dev"."kaggle_covid_airport"."stg_count_grouped_by_airport"
),
max_and_min_dates as (
    select * from "dev"."kaggle_covid_airport"."stg_airports_agg_events"
)
select
    registers.airportname,
    registers.rows_count
--    dates.max_date,
--    dates.min_date
from registers_count as registers
--join max_and_min_dates as dates
--    on registers.airportname = dates.rows_count
  );