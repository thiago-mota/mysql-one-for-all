SELECT 
    songs.song_name AS nome, COUNT(users.user_id) AS reproducoes
FROM
    SpotifyClone.songs AS songs
        INNER JOIN
    SpotifyClone.history AS history ON songs.song_id = history.song_id
        INNER JOIN
    SpotifyClone.users AS users ON history.user_id = users.user_id
WHERE
    users.plan_id = 1 OR users.plan_id = 4
GROUP BY nome
ORDER BY nome;