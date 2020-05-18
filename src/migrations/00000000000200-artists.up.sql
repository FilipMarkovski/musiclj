CREATE TABLE artists
( artist_id  SERIAL         NOT NULL PRIMARY KEY,
  name       VARCHAR(255)   NOT NULL,
  created_at TIMESTAMP      NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
  updated_at TIMESTAMP      NOT NULL DEFAULT (now() AT TIME ZONE 'utc'));
--;;
-- create an update trigger which updates our updated_at
-- column by calling the above function
CREATE TRIGGER update_artist_updated_at BEFORE UPDATE
ON artists FOR EACH ROW EXECUTE PROCEDURE
update_updated_at();
--;;
INSERT INTO artists (name) VALUES ('Metallica')
--;;
INSERT INTO artists (name) VALUES ('Red Hot Chili Peppers')
--;;
INSERT INTO artists (name) VALUES ('Coldplay')
--;;
INSERT INTO artists (name) VALUES ('Michael Bublé')
--;;
INSERT INTO artists (name) VALUES ('The Beatles')
--;;
INSERT INTO artists (name) VALUES ('AC/DC')
--;;
INSERT INTO artists (name) VALUES ('Queen')
--;;
INSERT INTO artists (name) VALUES ('Robbie Williams')
--;;
INSERT INTO artists (name) VALUES ('Michael Jackson')