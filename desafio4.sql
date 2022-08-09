SELECT 
    user_name AS usuario,
    IF(MAX(history.reproduction_date) LIKE ('2021%'),
        'Usuário ativo',
        'Usuário inativo') AS condicao_usuario
FROM
    SpotifyClone.users AS users
        INNER JOIN
    SpotifyClone.history AS history ON users.user_id = history.user_id
GROUP BY usuario
ORDER BY usuario ASC