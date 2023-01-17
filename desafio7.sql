SELECT
    a.artist_name AS artista,
    alb.album_name AS album,
    COUNT(a.artist_id) AS seguidores
FROM
    SpotifyClone.artist AS a
        INNER JOIN
    SpotifyClone.albums AS alb
    ON a.artist_id = alb.artist_id
				INNER JOIN
    SpotifyClone.follower AS f
    ON a.artist_id = f.artist_id
GROUP BY alb.album_id
ORDER BY seguidores DESC, artista ASC, album ASC;