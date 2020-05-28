CREATE TABLE albums
(album_id     SERIAL       NOT NULL PRIMARY KEY,
 artist_id    BIGINT       NOT NULL REFERENCES artists (artist_id),
 name         VARCHAR(255) NOT NULL,
 genre        VARCHAR(255) NOT NULL,
 release_date DATE         NOT NULL,
 created_at   TIMESTAMP    NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
 updated_at   TIMESTAMP    NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
 CONSTRAINT artist_album_name UNIQUE (name));
--;;
-- create an update trigger which updates our update_date
-- column by calling the above function
CREATE TRIGGER update_album_updated_at BEFORE UPDATE
ON albums FOR EACH ROW EXECUTE PROCEDURE
update_updated_at();
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Master of Puppets', 'Thrash metal', '1986-03-03'
    FROM artists a
    WHERE a.name = 'Metallica'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Californication', 'Alternative rock, funk rock, pop rock', '1999-06-08'
    FROM artists a
    WHERE a.name = 'Red Hot Chili Peppers'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'By the Way', 'Alternative rock, funk rock', '2002-07-09'
    FROM artists a
    WHERE a.name = 'Red Hot Chili Peppers'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Parachutes', 'Alternative rock', '2008-06-12'
    FROM artists a
    WHERE a.name = 'Coldplay'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Viva la Vida or Death and All His Friends', 'Alternative rock, art rock, pop rock, indie pop, art pop', '2000-07-10'
    FROM artists a
    WHERE a.name = 'Coldplay'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'To Be Loved', 'Vocal jazz, traditional pop, swing, power pop', '2013-04-15'
    FROM artists a
    WHERE a.name = 'Michael Bublé'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Abbey Road', 'Rock', '1969-09-26'
    FROM artists a
    WHERE a.name = 'The Beatles'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'High Voltage', 'Hard rock, blues rock', '1976-04-30'
    FROM artists a
    WHERE a.name = 'AC/DC'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Back in Black', 'Hard rock, heavy metal', '1980-07-25'
    FROM artists a
    WHERE a.name = 'AC/DC'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Highway to Hell', 'Hard rock, blues rock, rock and roll', '1979-07-27'
    FROM artists a
    WHERE a.name = 'AC/DC'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'A Night at the Opera', 'Progressive rock, pop, heavy metal, hard rock', '1975-11-21'
    FROM artists a
    WHERE a.name = 'Queen'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Queen II', 'Art rock, hard rock, glam rock, heavy metal, progressive rock', '1974-03-08'
    FROM artists a
    WHERE a.name = 'Queen'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Hot Space', 'Rock, disco, dance, funk, rhythm and blues, pop', '1982-05-21'
    FROM artists a
    WHERE a.name = 'Queen'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'A Day at the Races', 'Hard rock, symphonic rock, pop, glam rock', '1976-12-10'
    FROM artists a
    WHERE a.name = 'Queen'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Escapology', 'Pop rock', '2002-11-18'
    FROM artists a
    WHERE a.name = 'Robbie Williams'
--;;
INSERT INTO albums (artist_id, name, genre, release_date)
    SELECT a.artist_id, 'Thriller', 'Pop, post-disco, R&B, rock, funk', '1982-11-30'
    FROM artists a
    WHERE a.name = 'Michael Jackson'