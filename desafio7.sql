SELECT 
    artists.artist_name AS artista,
    albums.album_name AS album,
    COUNT(followed_artists.user_id) AS seguidores
FROM
    SpotifyClone.artists AS artists
        INNER JOIN
    SpotifyClone.albums AS albums ON artists.artist_id = albums.artist_id
        INNER JOIN
    SpotifyClone.followed_artists AS followed_artists ON albums.artist_id = followed_artists.artist_id
    
    GROUP BY artista, album
    ORDER BY seguidores DESC, artista, album