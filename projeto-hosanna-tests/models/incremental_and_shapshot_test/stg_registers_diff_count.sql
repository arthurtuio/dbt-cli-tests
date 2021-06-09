{{ config(materialized='incremental', schema='incremental_and_shapshot_test') }}

with cte_max_updated_at as ( -- precisa ser feito aqui fora porque se for direto no WHERE quebra
    select max(updated_at) as max_updated_at
    from {{ source('incremental_and_shapshot_test', 'governors_county_candidate_with_dates_columns') }}
)
select
    count(*)
from {{ source('incremental_and_shapshot_test', 'governors_county_candidate_with_dates_columns') }}
{% if is_incremental() %} -- macro pronta já criada no DBT
where updated_at >= (select max_updated_at from cte_max_updated_at) -- Só vai entrar na query se is_incremental() for TRUE
{% endif %}
group by 1, 2
