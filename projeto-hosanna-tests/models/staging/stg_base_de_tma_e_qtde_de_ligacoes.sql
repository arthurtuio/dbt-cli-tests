{{ config(materialized='table', schema='test_schema') }}

SELECT
    h.datahora as metric_date,
    c.email as email,
    COALESCE(SUM(is_queue_time_answered),0) as tempo_falado,
    COALESCE(COUNT(*),0) AS "received_calls",
    COALESCE(COUNT(CASE WHEN (h.is_queue_status = 3 or h.is_queue_status = 4) THEN h.is_cdr_uniqueid ELSE NULL END ),0) AS "abandon_calls"
FROM
    spectrum.easy_core_contatos_ctrl as c
    -- source('spectrum', 'easy_core_contatos_ctrl') as c
JOIN
    spectrum.easy_core_contatos_hist as h
    -- source('spectrum', 'easy_core_contatos_hist') as h
ON
    h.easy_core_contatos_ctrl_id = c.id
GROUP BY 1, 2

