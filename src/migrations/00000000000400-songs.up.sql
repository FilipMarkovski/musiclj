CREATE TABLE songs
(song_id       SERIAL        NOT NULL PRIMARY KEY,
 album_id      BIGINT        NOT NULL REFERENCES albums (album_id),
 name          VARCHAR(255)  NOT NULL,
 track_number  INTEGER       NOT NULL,
 youtube_link  VARCHAR(255)  NOT NULL,
 created_at    TIMESTAMP     NOT NULL DEFAULT (now() AT TIME ZONE 'utc'),
 updated_at    TIMESTAMP     NOT NULL DEFAULT (now() AT TIME ZONE 'utc'));
--;;
-- create an update trigger which updates our update_date
-- column by calling the above function
CREATE TRIGGER update_song_updated_at BEFORE UPDATE
ON songs FOR EACH ROW EXECUTE PROCEDURE
update_updated_at();
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Don''t Panic', 1, 'https://www.youtube.com/watch?v=8uxt-FnNy2I&list=PL00176FD3DE99A115'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Shiver', 2, 'https://www.youtube.com/watch?v=otNqnVgEs9M&list=PL00176FD3DE99A115&index=2'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Spies', 3, 'https://www.youtube.com/watch?v=9QzDHPcNfrw&list=PL00176FD3DE99A115&index=3'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Sparks', 4, 'youtube.com/watch?v=Ar48yzjn1PE&list=PL00176FD3DE99A115&index=4'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Yellow', 5, 'https://www.youtube.com/watch?v=tdVAqxNLXiw&list=PL00176FD3DE99A115&index=5'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Trouble', 6, 'https://www.youtube.com/watch?v=FPzI4dpEcF8&list=PL00176FD3DE99A115&index=6'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Parachutes', 7, 'https://www.youtube.com/watch?v=v77WFwYtUE0'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'High Speed', 8, 'https://www.youtube.com/watch?v=iv6F5aZU34I&list=PL00176FD3DE99A115&index=7'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'We Never Change', 9, 'https://www.youtube.com/watch?v=uZSobH1wiiM&list=PL00176FD3DE99A115&index=8'
    FROM albums a
    WHERE a.name = 'Parachutes'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Everything''s Not Lost', 10, 'https://www.youtube.com/watch?v=0IywjWWlxF8&list=PL00176FD3DE99A115&index=9'
    FROM albums a
    WHERE a.name = 'Parachutes'