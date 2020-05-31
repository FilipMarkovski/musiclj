CREATE TABLE songs
(song_id       SERIAL        NOT NULL PRIMARY KEY,
 album_id      BIGINT        NOT NULL REFERENCES albums (album_id) ON DELETE CASCADE,
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
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Battery', 1, 'https://www.youtube.com/watch?v=tRJxnxVu3C8&list=OLAK5uy_lHtcjdo7MU4A3Tt3MuErEdEOOqs4UgngE'
    FROM albums a
    WHERE a.name = 'Master of Puppets'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Master of Puppets', 2, 'https://www.youtube.com/watch?v=S7blkui3nQc&list=OLAK5uy_lHtcjdo7MU4A3Tt3MuErEdEOOqs4UgngE&index=2'
    FROM albums a
    WHERE a.name = 'Master of Puppets'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'The Thing That Should Not Be', 3, 'https://www.youtube.com/watch?v=5Ksz_fS9TUI&list=OLAK5uy_lHtcjdo7MU4A3Tt3MuErEdEOOqs4UgngE&index=3'
    FROM albums a
    WHERE a.name = 'Master of Puppets'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Welcome Home (Sanitarium)', 4, 'https://www.youtube.com/watch?v=peENJe_ORdI&list=OLAK5uy_lHtcjdo7MU4A3Tt3MuErEdEOOqs4UgngE&index=4'
    FROM albums a
    WHERE a.name = 'Master of Puppets'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Disposable Heroes', 5, 'https://www.youtube.com/watch?v=jtNrx1c3Xh8&list=OLAK5uy_lHtcjdo7MU4A3Tt3MuErEdEOOqs4UgngE&index=5'
    FROM albums a
    WHERE a.name = 'Master of Puppets'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Leper Messiah', 6, 'https://www.youtube.com/watch?v=ABL98xb8IFU&list=OLAK5uy_lHtcjdo7MU4A3Tt3MuErEdEOOqs4UgngE&index=6'
    FROM albums a
    WHERE a.name = 'Master of Puppets'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Orion (Instrumental)', 7, 'https://www.youtube.com/watch?v=NctSru6Cw6s&list=OLAK5uy_lHtcjdo7MU4A3Tt3MuErEdEOOqs4UgngE&index=7'
    FROM albums a
    WHERE a.name = 'Master of Puppets'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Damage, Inc.', 8, 'https://www.youtube.com/watch?v=Zx-8UxBKUEo&list=OLAK5uy_lHtcjdo7MU4A3Tt3MuErEdEOOqs4UgngE&index=8'
    FROM albums a
    WHERE a.name = 'Master of Puppets'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Around the World', 1, 'https://www.youtube.com/watch?v=a9eNQZbjpJk&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Parallel Universe', 2, 'https://www.youtube.com/watch?v=N5Vgm6-KO3o&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=2'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Scar Tissue', 3, 'https://www.youtube.com/watch?v=mzJj5-lubeM&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=3'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Otherside', 4, 'https://www.youtube.com/watch?v=rn_YodiJO6k&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=4'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Get on Top', 5, 'https://www.youtube.com/watch?v=NJnOl3trYW0&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=5'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Californication', 6, 'https://www.youtube.com/watch?v=YlUKcNNmywk&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=6'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Easily', 7, 'https://www.youtube.com/watch?v=C-2xtTpgQXM&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=7'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Porcelain', 8, 'https://www.youtube.com/watch?v=j0tHXHcq724&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=8'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Emit Remmus', 9, 'https://www.youtube.com/watch?v=bR6lbN40-Ho&list=OLAK5uy_kEbANaGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=9'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'I Like Dirt', 10, 'https://www.youtube.com/watch?v=5fdJdfXid70&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=10'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'This Velvet Glove', 11, 'https://www.youtube.com/watch?v=TqoDFpLyio0&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=11'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Savior', 12, 'https://www.youtube.com/watch?v=UijW9hGpnzc&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=12'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Purple Stain', 13, 'https://www.youtube.com/watch?v=H1LF-qyoNjo&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=13'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Right on Time', 14, 'https://www.youtube.com/watch?v=PSqH-4Wubq0&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=14'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Road Trippin''', 15, 'https://www.youtube.com/watch?v=11GYvfYjyV0&list=OLAK5uy_kEbANGGtoT4n87DQ3ESZyh3l9LK5uWII0&index=15'
    FROM albums a
    WHERE a.name = 'Californication'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'By the Way', 1, 'https://www.youtube.com/watch?v=6GMKYueN4mM&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Universally Speaking', 2, 'https://www.youtube.com/watch?v=K98svvF0P_M&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=2'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'This Is the Place', 3, 'https://www.youtube.com/watch?v=gqgm7ViA2Ag&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=3'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Dosed', 4, 'https://www.youtube.com/watch?v=WeMXdaId60U&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=4'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Don''t Forget Me', 5, 'https://www.youtube.com/watch?v=SnQ0E-UVt1g&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=5'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'The Zephyr Song', 6, 'https://www.youtube.com/watch?v=-BLfnaPmNJ0&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=6'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Can''t Stop', 7, 'https://www.youtube.com/watch?v=D4INE2zO9OU&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=7'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'I Could Die For You', 8, 'https://www.youtube.com/watch?v=5hEjkH2DF5c&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=8'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Midnight', 9, 'https://www.youtube.com/watch?v=4QhFuJWqTAc&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=9'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Throw Away Your Television', 10, 'https://www.youtube.com/watch?v=Z2f6JmTssLQ&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=10'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Cabron', 11, 'https://www.youtube.com/watch?v=5wWd1a5U3vE&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=11'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Tear', 12, 'https://www.youtube.com/watch?v=etQKBq0Op4s&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=12'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'On Mercury', 13, 'https://www.youtube.com/watch?v=X4ahMG3Iu8w&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=13'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Minor Thing', 14, 'https://www.youtube.com/watch?v=iuCWDFNyyU4&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=14'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Warm Tape', 15, 'https://www.youtube.com/watch?v=iiyQWOSpOEE&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=15'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Venice Queen', 16, 'https://www.youtube.com/watch?v=3s86rJvMIS0&list=PLfUV806q_Ri44JlEw_CTexB8X9FuF8yBz&index=16'
    FROM albums a
    WHERE a.name = 'By the Way'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Life in Technicolor II', 1, 'https://www.youtube.com/watch?v=fXSovfzyx28&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Cemeteries of London', 2, 'https://www.youtube.com/watch?v=v6gxuxw69z0&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=2'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Lost', 3, 'https://www.youtube.com/watch?v=2-RjMRP5IbI&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=3'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, '42', 4, 'https://www.youtube.com/watch?v=ez6eauLcOuc&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=4'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Lovers in Japan', 5, 'https://www.youtube.com/watch?v=OTFFQkdhw6Q&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=5'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Yes', 6, 'https://www.youtube.com/watch?v=V4qdbGcFBxw&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=6'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Viva la Vida', 7, 'https://www.youtube.com/watch?v=dvgZkm1xWPE&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=7'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Violet Hill', 8, 'https://www.youtube.com/watch?v=IakDItZ7f7Q&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=8'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Strawberry Swing', 9, 'https://www.youtube.com/watch?v=h3pJZSTQqIg&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=9'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Death and All His Friends', 10, 'https://www.youtube.com/watch?v=QvoM6TK8O6w&list=OLAK5uy_kXUSXDVkCcqggfSIANQ04RzgV22bZuAL8&index=10'
    FROM albums a
    WHERE a.name = 'Viva la Vida or Death and All His Friends'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'You Make Me Feel So Young', 1, 'https://www.youtube.com/watch?v=_AjSG4ApOBg&list=PLJNbijG2M7OyfhmpU1SvW0Xwp1AkfrUP5'
    FROM albums a
    WHERE a.name = 'To Be Loved'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'It''s a Beautiful Day', 2, 'https://www.youtube.com/watch?v=5QYxuGQMCuU&list=PLJNbijG2M7OyfhmpU1SvW0Xwp1AkfrUP5&index=2'
    FROM albums a
    WHERE a.name = 'To Be Loved'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Come Together', 1, 'https://www.youtube.com/watch?v=45cYwDMibGo&list=OLAK5uy_k2JcEE3_maNjnVBKU2s1JjhaZ4rxwgaME'
    FROM albums a
    WHERE a.name = 'Abbey Road'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'It''s a Long Way to the Top (If You Wanna Rock ''N'' Roll)', 1, 'https://www.youtube.com/watch?v=vj_rvLVpqg8&list=PLBzBwYhHpqLLTp7rdiOuSflXO0GCzxmpY'
    FROM albums a
    WHERE a.name = 'High Voltage'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'You''re My Best Friend', 4, 'https://www.youtube.com/watch?v=HaZpZQG2z10&list=OLAK5uy_kTV6O4QNnkTdBPpcOEUcHqNFQ6Y9jrKbA&index=4'
    FROM albums a
    WHERE a.name = 'A Night at the Opera'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Somebody To Love', 6, 'https://www.youtube.com/watch?v=kijpcUv-b8M'
    FROM albums a
    WHERE a.name = 'A Day at the Races'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Feel', 2, 'https://www.youtube.com/watch?v=iy4mXZN1Zzk&list=OLAK5uy_mh_5qLSs362ZimrWPaAu-U33Y7eP9nQcU&index=2'
    FROM albums a
    WHERE a.name = 'Escapology'
--;;
INSERT INTO songs (album_id, name, track_number, youtube_link)
    SELECT a.album_id, 'Thriller', 4, 'https://www.youtube.com/watch?v=sOnqjkJTMaA'
    FROM albums a
    WHERE a.name = 'Thriller'