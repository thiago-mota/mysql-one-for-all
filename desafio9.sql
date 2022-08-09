SELECT 
    COUNT(song_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.users AS users
        INNER JOIN
    SpotifyClone.history AS history ON users.user_id = history.user_id
WHERE
    users.user_name = 'Bill'