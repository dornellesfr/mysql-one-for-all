SELECT
    MIN(p.value) AS faturamento_minimo,
    MAX(p.value) AS faturamento_maximo,
    ROUND(AVG(p.value), 2) AS faturamento_medio,
    SUM(p.value) AS faturamento_total
FROM
    SpotifyClone.plan AS p
        INNER JOIN
    SpotifyClone.user AS u
    ON p.plan_id = u.plan_id;