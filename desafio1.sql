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
    album_name VARCHAR(100) NOT NULL,
    album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artist_id INT NOT NULL,
    release_year YEAR NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.songs (
    song_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    song_duration INT NOT NULL,
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

INSERT INTO SpotifyClone.albums(album_name, release_year, artist_id)
VALUES(
'Envious', 1990, 1),
('Exuberant', 1993, 1),
('Hallowed Steam', 1995, 2),
('Incandescent', 1998, 3),
('Temporary Culture', 2001, 4),
('Library of liberty', 2003, 4),
('Chained Down', 2007, 5),
('Cabinet of fools', 2012, 5),
('No guarantees', 2015, 5),
('Apparatus', 2015, 6);

INSERT INTO SpotifyClone.songs(song_name, album_id, song_duration)
  VALUES('Soul For Us', 1, 200),
  ('Reflections Of Magic', 1, 163),
	('Dance With Her Own', 1, 116),
	('Troubles Of My Inner Fire', 2, 203),
	('Time Fireworks', 2, 152),
	('Magic Circus', 3, 105),
	('Honey, So Do I', 3, 207),
	("Sweetie, Let's Go Wild", 3, 139),
	('She Knows', 3, 244),
	('Fantasy For Me', 4, 100),
	('Celebration Of More', 4, 146),
	('Rock His Everything', 4, 223),
	('Home Forever', 4, 231),
	('Diamond Power', 4, 241),
	("Let's Be Silly", 4, 132),
	('Thang Of Thunder', 5, 240),
	('Words Of Her Life', 5, 185),
	('Without My Streets', 5, 176),
	('Need Of The Evening', 6, 190),
	('History Of My Roses', 6, 222),
	('Without My Love', 6, 111),
	('Walking And Game', 6, 123),
	('Young And Father', 6, 197),
	('Finding My Traditions', 7, 179),
	('Walking And Man', 7, 229),
	('Hard And Time', 7, 135),
	("Honey, I'm A Lone Wolf", 7, 150),
	("She Thinks I Won't Stay Tonight", 8, 166),
	("He Heard You're Bad For Me", 8, 154),
	("He Hopes We Can't Stay", 8, 210),
	('I Know I Know', 8, 117),
	("He's Walking Away", 9, 159),
	("He's Trouble", 9, 138),
	('I Heard I Want To Bo Alone', 9, 120),
	('I Ride Alone', 9, 151),
	('Honey', 10, 79),
	('You Cheated On Me', 10, 95),
	("Wouldn't It Be Nice", 10, 213),
	('Baby', 10, 136),
	('You Make Me Feel So..', 10, 83);