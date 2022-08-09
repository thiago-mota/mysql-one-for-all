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

INSERT INTO SpotifyClone.plans(plan_name, plan_value)
VALUES('gratuito', 0.00),
('familiar', 7.99),
('universitÃ¡rio', 5.99),
('pessoal', 6.99)

INSERT INTO SpotifyClone.users(user_name, user_age, plan_id, subscription_date)
VALUES ('Thati', 23, 1, '2019-10-20'),
  ('Cintia', 35, 2, '2017-12-30'),
  ('Bill', 20, 3, '2019-06-05'),
  ('Roger', 45, 4, '2020-05-13'),
  ('Norman', 58, 4, '2017-02-17'),
  ('Patrick', 33, 2, '2017-01-06'),
  ('Vivian', 26, 3, '2018-01-05'),
  ('Carol', 19, 3, '2018-02-14'),
  ('Angelina', 42, 2, '2018-04-29'),
  ('Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.artists(artist_name)
VALUES ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');