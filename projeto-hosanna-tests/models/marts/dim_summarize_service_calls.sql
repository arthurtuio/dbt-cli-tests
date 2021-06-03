{{ config(materialized='table', schema='test_schema' ) }}
-- {{ config(materialized='view', bind=False, schema='test_schema') }}

SELECT
    coalesce(email, 'abandon') AS email,
    round( sum(abandon_calls) / sum(received_calls) * 100, 2) as abandon_rate_phone,
    sum(received_calls) AS received_calls,
    sum(abandon_calls) AS abandon_calls,
    sum(tempo_falado) as total_duration_seconds
-- FROM dev.spectrum_test_schema.stg_base_de_tma_e_qtde_de_ligacoes
FROM {{ ref('stg_base_de_tma_e_qtde_de_ligacoes') }}
