SELECT 
    u.user_name AS usuario,
    IF (YEAR(MAX(h.reprodution_date)) > 2020, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.user AS u
        INNER JOIN
    SpotifyClone.history AS h
    ON u.user_id = h.user_id
GROUP BY u.user_name
ORDER BY usuario ASC;