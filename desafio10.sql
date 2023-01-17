SELECT
  m.music_name AS nome,
  COUNT(m.music_name) AS reproducoes
FROM
    SpotifyClone.musics AS m
        INNER JOIN
    SpotifyClone.history AS h
    ON m.music_id = h.music_id
				INNER JOIN
		SpotifyClone.user AS u
    ON u.user_id = h.user_id
				INNER JOIN
    SpotifyClone.plan AS p
    ON u.plan_id = p.plan_id
WHERE p.plan_id = 1 OR p.plan_id = 4
GROUP BY nome
ORDER BY nome ASC;
