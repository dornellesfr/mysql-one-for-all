DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plan(
    `plan_id` INT PRIMARY KEY AUTO_INCREMENT,
    `plan_name` VARCHAR(20) NOT NULL,
    `value` DECIMAL(5 , 2 ) NOT NULL
)  Engine=InnoDB;

  CREATE TABLE SpotifyClone.user(
		`user_id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_name` VARCHAR(50) NOT NULL,
    `age` INT NOT NULL,
    `date_assigned` DATETIME NOT NULL,
    `plan_id` INT NOT NULL,
		FOREIGN KEY (plan_id)
        REFERENCES SpotifyClone.plan (plan_id)
)  Engine=InnoDB;

  CREATE TABLE SpotifyClone.artist (
    `artist_id` INT PRIMARY KEY AUTO_INCREMENT,
    `artist_name` VARCHAR(30) NOT NULL
)  ENGINE=INNODB;

  CREATE TABLE SpotifyClone.albums (
    `album_id` INT PRIMARY KEY AUTO_INCREMENT,
    `album_name` VARCHAR(30) NOT NULL,
    `release_date` YEAR NOT NULL,
    `artist_id` INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
)  ENGINE=INNODB;

  CREATE TABLE SpotifyClone.musics(
      `music_id` INT PRIMARY KEY AUTO_INCREMENT,
      `music_name` VARCHAR(80) NOT NULL,
      `duration` INT NOT NULL,
      `album_id` INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES albums (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.history(
      `reprodution_date` DATETIME NOT NULL,
      `music_id` INT NOT NULL,
      `user_id` INT NOT NULL,
      CONSTRAINT PRIMARY KEY(music_id, user_id),
      FOREIGN KEY (music_id) REFERENCES musics (music_id),
      FOREIGN KEY (user_id) REFERENCES user (user_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.follower(
      `artist_id` INT,
      `user_id` INT NOT NULL,
      CONSTRAINT PRIMARY KEY (artist_id, user_id),
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
      FOREIGN KEY (user_id) REFERENCES user (user_id)
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.plan (plan_name, `value`)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.user (user_name, age, date_assigned, plan_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

  INSERT INTO SpotifyClone.artist (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albums (artist_id, album_name, release_date)
  VALUES
    (1, 'Renaissance', '2022'),
    (2, 'Jazz','1978'),
    (2, 'Hot Space', '1982'),
    (3, 'Falso Brilhante', '1998'),
    (3, 'Vento de Maio', '2001'),
    (4, 'QVVJFA?', '2003'),
    (5, 'Somewhere Far Beyond', '2007'),
    (6, 'I Put A Spell On You', '2012');

  INSERT INTO SpotifyClone.musics (music_name, duration, album_id)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard’s Song', 244, 7),
    ('Feeling Good', 100, 8);

  INSERT INTO SpotifyClone.history (reprodution_date, music_id, user_id)
  VALUES
    ('2022-02-28 10:45:55', 8, 1),
    ('2020-05-02 05:30:35', 2, 1),
    ('2020-03-06 11:22:33', 10, 1),
    ('2022-08-05 08:05:17', 10, 2),
    ('2020-01-02 07:40:33', 7, 2),
    ('2020-11-13 16:55:13', 10, 3),
    ('2020-12-05 18:38:30', 2, 3),
    ('2021-08-15 17:10:10', 8, 4),
    ('2022-01-09 01:44:33', 8, 5),
    ('2020-08-06 15:23:43', 5, 5),
    ('2017-01-24 00:31:17', 7, 6),
    ('2017-10-12 12:35:20', 1, 6),
    ('2011-12-15 22:30:49', 4, 7),
    ('2012-03-17 14:56:41', 4, 8),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 3, 10);

  INSERT INTO SpotifyClone.follower (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);