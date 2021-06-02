SELECT
    -- date_format(h.datahora, "%Y-%m-%d %H:00:00") as metric_date,
    h.datahora as metric_date,

    -- col.email as email,
    c.email as email,

    COALESCE(SUM(is_queue_time_answered),0) as tempo_falado,
    COALESCE(COUNT(*),0) AS "received_calls",
    COALESCE(COUNT(CASE WHEN (h.is_queue_status = 3 or h.is_queue_status = 4) THEN h.is_cdr_uniqueid ELSE NULL END ),0) AS "abandon_calls"
FROM
    -- TABELA DE CONTATOS DE LIGAÇÕES DO HOSANNA
    spectrum.easy_core_contatos_ctrl c
JOIN
    -- TABELA DE HISTÓRICO DE EVENTOS DE LIGAÇÕES (ex. transferências de ligações)
    spectrum.easy_core_contatos_hist h ON h.easy_core_contatos_ctrl_id = c.id
GROUP BY 1, 2
