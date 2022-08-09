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
