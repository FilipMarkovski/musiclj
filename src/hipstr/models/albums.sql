-- name: get-recently-added
-- Gets the 10 most recently added albums in the db.
SELECT art.name as artist, alb.album_id, alb.name as album_name, alb.release_date, alb.created_at
FROM artists art
INNER JOIN albums alb ON art.artist_id = alb.artist_id
ORDER BY alb.created_at DESC
LIMIT 10;

-- name: get-artist-albums
-- Gets an Artist and all of his work.
SELECT art.name as artist, alb.album_id, alb.name as album_name, alb.release_date, alb.created_at
FROM artists art
INNER JOIN albums alb ON art.artist_id = alb.artist_id
WHERE art.name = :artist_name
ORDER BY alb.release_date DESC;
