DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans (
    plan_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    plan_value DECIMAL(3 , 2 )
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    user_age INT NOT NULL,
    plan_id INT NOT NULL,
    subscription_date DATE,
    FOREIGN KEY (plan_id)
        REFERENCES plans (plan_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.artists (
    artist_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.albums (
    album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artist_id INT NOT NULL,
    release_year YEAR NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.songs (
    song_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL,
    song_duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albums (album_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.followed_artists (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    PRIMARY KEY (artist_id , user_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.history (
    song_id INT NOT NULL,
    user_id INT NOT NULL,
    reproduction_date DATETIME,
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    PRIMARY KEY (song_id , user_id)
)  ENGINE=INNODB;