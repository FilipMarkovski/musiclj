CREATE TABLE genre
(genre_id     SERIAL        NOT NULL PRIMARY KEY,
 genre_name   VARCHAR(255)  NOT NULL,
 CONSTRAINT genre_unique_name  UNIQUE (genre_name));
--;;
INSERT INTO genre (genre_name)
VALUES ('Pop music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Rock')
--;;
INSERT INTO genre (genre_name)
VALUES ('Musical theatre')
--;;
INSERT INTO genre (genre_name)
VALUES ('Jazz')
--;;
INSERT INTO genre (genre_name)
VALUES ('Hip hop music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Folk music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Blues')
--;;
INSERT INTO genre (genre_name)
VALUES ('Heavy metal')
--;;
INSERT INTO genre (genre_name)
VALUES ('Singing')
--;;
INSERT INTO genre (genre_name)
VALUES ('Country music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Rhythm and blues')
--;;
INSERT INTO genre (genre_name)
VALUES ('Classical music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Electronic dance music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Reggae')
--;;
INSERT INTO genre (genre_name)
VALUES ('Punk rock')
--;;
INSERT INTO genre (genre_name)
VALUES ('Soul music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Electronic music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Funk')
--;;
INSERT INTO genre (genre_name)
VALUES ('Popular music')
--;;
INSERT INTO genre (genre_name)
VALUES ('House music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Dance music')
--;;
INSERT INTO genre (genre_name)
VALUES ('Disco')
--;;
INSERT INTO genre (genre_name)
VALUES ('Techno')
--;;
INSERT INTO genre (genre_name)
VALUES ('Alternative rock')
--;;
INSERT INTO genre (genre_name)
VALUES ('Instrumental')
--;;
INSERT INTO genre (genre_name)
VALUES ('Pop rock')
--;;
INSERT INTO genre (genre_name)
VALUES ('Orchestra')
--;;
INSERT INTO genre (genre_name)
VALUES ('Trance music')
--;;
INSERT INTO genre(genre_name)
VALUES('Art rock')
--;;
INSERT INTO genre(genre_name)
VALUES('Indie pop')
--;;
INSERT INTO genre(genre_name)
VALUES('Art pop')