CREATE TABLE albums
(album_id     SERIAL       NOT NULL PRIMARY KEY,
 artist_id    BIGINT       NOT NULL REFERENCES artists (artist_id),
 name         VARCHAR(255) NOT NULL,
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
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Master of Puppets', '1986-03-03'
    FROM artists a
    WHERE a.name = 'Metallica'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Californication', '1999-06-08'
    FROM artists a
    WHERE a.name = 'Red Hot Chili Peppers'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'By the Way', '2002-07-09'
    FROM artists a
    WHERE a.name = 'Red Hot Chili Peppers'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Parachutes', '2008-06-12'
    FROM artists a
    WHERE a.name = 'Coldplay'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Viva la Vida or Death and All His Friends', '2000-07-10'
    FROM artists a
    WHERE a.name = 'Coldplay'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'To Be Loved', '2013-04-15'
    FROM artists a
    WHERE a.name = 'Michael Bublé'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Abbey Road', '1969-09-26'
    FROM artists a
    WHERE a.name = 'The Beatles'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'High Voltage', '1976-04-30'
    FROM artists a
    WHERE a.name = 'AC/DC'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Back in Black', '1980-07-25'
    FROM artists a
    WHERE a.name = 'AC/DC'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Highway to Hell', '1979-07-27'
    FROM artists a
    WHERE a.name = 'AC/DC'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'A Night at the Opera', '1975-11-21'
    FROM artists a
    WHERE a.name = 'Queen'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Queen II', '1974-03-08'
    FROM artists a
    WHERE a.name = 'Queen'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Hot Space', '1982-05-21'
    FROM artists a
    WHERE a.name = 'Queen'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'A Day at the Races', '1976-12-10'
    FROM artists a
    WHERE a.name = 'Queen'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Escapology', '2002-11-18'
    FROM artists a
    WHERE a.name = 'Robbie Williams'
--;;
INSERT INTO albums (artist_id, name, release_date)
    SELECT a.artist_id, 'Thriller', '1982-11-30'
    FROM artists a
    WHERE a.name = 'Michael Jackson'