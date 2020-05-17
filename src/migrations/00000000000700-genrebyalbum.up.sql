CREATE TABLE genre_by_album
(genre_id   INTEGER  REFERENCES genre (genre_id),
 album_id   INTEGER  REFERENCES albums (album_id) ON UPDATE CASCADE ON DELETE CASCADE,
 CONSTRAINT genre_by_album_pkey PRIMARY KEY (genre_id, album_id));
--;;
INSERT INTO genre_by_album (genre_id, album_id)
VALUES (24, 8)
--;;
INSERT INTO genre_by_album (genre_id, album_id)
VALUES (24, 9)
--;;
INSERT INTO genre_by_album (genre_id, album_id)
VALUES (29, 9)
--;;
INSERT INTO genre_by_album (genre_id, album_id)
VALUES (30, 9)
--;;
INSERT INTO genre_by_album (genre_id, album_id)
VALUES (31, 9)