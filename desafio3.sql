SELECT 
    users.user_name AS usuario,
    COUNT(history.song_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(songs.song_duration) / 60, 2) AS total_minutos
FROM
    SpotifyClone.users AS users
        INNER JOIN
    SpotifyClone.history AS history ON users.user_id = history.user_id
        INNER JOIN
    SpotifyClone.songs AS songs ON history.song_id = songs.song_id
GROUP BY usuario
ORDER BY usuario ASC;