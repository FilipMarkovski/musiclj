CREATE TABLE genre_by_track
(genre_id   INTEGER  REFERENCES genre (genre_id),
 song_id    INTEGER  REFERENCES songs (song_id) ON UPDATE CASCADE ON DELETE CASCADE,
 CONSTRAINT genre_by_track_pkey PRIMARY KEY (genre_id, song_id));
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 1)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 2)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 3)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 4)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 5)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 6)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 7)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 8)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 9)
--;;
INSERT INTO genre_by_track (genre_id, song_id)
VALUES (24, 10)