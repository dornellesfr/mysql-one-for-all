SELECT
    a.artist_name AS artista,
    alb.album_name AS album
FROM
    SpotifyClone.artist AS a
        INNER JOIN
    SpotifyClone.albums AS alb
    ON a.artist_id = alb.artist_id
WHERE a.artist_id = 3
ORDER BY album ASC;