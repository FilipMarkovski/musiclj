(ns musiclj.models.album_model
  (:require ;[yesql.core :refer [defqueries]]
            [clojure.java.jdbc :as jdbc]
            [musiclj.models.connection :refer [db-spec]]
            [korma.core :as k]
            [korma.db :as db]
            ))

;(defqueries "hipstr/models/albums.sql" { :connection db-spec })
;(defqueries "hipstr/models/artists.sql" { :connection db-spec })

(declare artists albums songs genre genre_by_track genre_by_album)


; define our artists entity.
; by default korma assumes the entity and table name map
(k/defentity artists
; We must define the primary key because it does not
; adhere to the korma defaults.
  (k/pk :artist_id)
  ; define the relationship between artists and albums
  (k/has-many albums))


; define the albums entity
(k/defentity albums
   ; again, we have to map the primary key to our korma definition.
   (k/pk :album_id)
   ; We can define the foreign key relationship of the albums back
   ; to the artists table
   ; The :fk tells on which key the two tables are joined
   (k/belongs-to artists {:fk :artist_id})
   ; define the relationship between albums and songs, and albums and genres
   (k/has-many songs)
   (k/has-many genre))


; define the songs entity
(k/defentity songs
   ; again, we have to map the primary key to our korma definition.
   (k/pk :song_id)
   ; We can define the foreign key relationship of the songs back
   ; to the albums table
   (k/belongs-to albums {:fk :album_id})
   ; define the relationship between songs and genres
   (k/has-many genre))


; define the genre entity
(k/defentity genre
   ; again, we have to map the primary key to our korma definition.
   (k/pk :genre_id)
   ; define the relationship between songs and genres, and albums and genres
   (k/has-many songs)
   (k/has-many albums))


; define the genre_by_track entity
(k/defentity genre_by_track
   ; again, we have to map the primary key to our korma definition.
   ; this time it's a composite primary key
   (k/pk :genre_id)
   (k/pk :song_id)
   ; We can define the foreign key relationship of the
   ; genre_by_track table with genres and songs
   (k/belongs-to genre {:fk :genre_id})
   (k/belongs-to songs {:fk :song_id}))


; define the genre_by_album entity
(k/defentity genre_by_album
   ; again, we have to map the composite primary key
   ; to our korma definition.
   (k/pk :genre_id)
   (k/pk :album_id)
   ; We can define the foreign key relationship of the
   ; genre_by_album table with genres and albums
   (k/belongs-to genre {:fk :genre_id})
   (k/belongs-to albums {:fk :album_id}))


; -- name: get-recently-added
; -- Gets the 10 most recently added albums in the db.
; SELECT art.name as artist, alb.album_id, alb.name as album_name,
;        alb.release_date, alb.created_at
; FROM artists art
; INNER JOIN albums alb ON art.artist_id = alb.artist_id
; ORDER BY alb.created_at DESC
; LIMIT 10
(defn get-recently-added
  "Gets the 10 most recently added albums in the db."
  []
  (k/select albums
          (k/fields :album_id
                  [:name :album_name] :release_date :created_at)
          (k/with artists (k/fields [:name :artist] :artist_id))
          (k/order :created_at :DESC)
          (k/limit 10))
  )

(defn get-artists
  "Gets all artists"
  []
  (k/select artists
    (k/fields :name)))

(defn get-artist-by-id
  "Gets artist of id"
  [artist]
  (first
    (k/select artists
              (k/fields :name)
              (k/where {:artist_id (Integer/parseInt artist)})
              ))
  )


(defn get-albums
  "Gets all albums"
  []
  (k/select albums
    (k/fields :name)))

; -- name: get-artist-albums
; -- Gets the discography for a given artist.
; SELECT alb.album_id, alb.name, alb.release_date
; FROM albums alb
; INNER JOIN artists art on alb.artist_id = art.artist_id
; WHERE
;     art.name = :artist
; ORDER BY alb.release_date DESC
(defn get-artist-albums
  "Gets the discography for a given artist."
  ; for backwards compatibility it is expected that the
  ; artist param is a map, {:artist [value]}
  [artist]
  (k/select albums
          (k/join artists)
          ; for backwards compatibility we need to rename the :albums.name
          ; field to :album_name
          (k/fields :albums.album_id [:albums.name :album_name] :albums.release_date)
          (k/where {:artists.name (:artist artist)})
          (k/order :release_date :DESC)))


; SELECT s.name, s.track_number, s.youtube_link
; FROM songs s
; INNER JOIN albums AS alb
;       ON alb.album_id = s.album_id
; WHERE alb.name = :album_name;
;
(defn get-album-songs
  "Gets the album track list."
  ; for backwards compatibility it is expected that the
  ; album param is a map, {:album [value]}
  [album]
  (k/select songs
          (k/fields :song_id [:songs.name :song_name] :songs.track_number :songs.youtube_link)
          ; for backwards compatibility we need to rename the :albums.name
          ; field to :album_name
          (k/with albums (k/fields [:albums.name :album_name]))
          (k/where {:albums.name (:album_name album)})
          (k/order :track_number :ASC))
)

(defn get-album-songs-with-fields
  "Fetches the specific song from the database for a particular album."
  ; for backwards compatibility it is expected that the
  ; album param is {:artist_id :artist_name}
  [song]
  (first
    (k/select songs
              (k/where {:album_id (:album_id song)
                        :name (:name song)}))))



;-- name: insert-album<!
;-- Adds the album for the given artist to the database
; INSERT INTO albums (artist_id, name, release_date)
; VALUES (:artist_id, :album_name, date(:release_date))
(defn insert-album<!
  "Adds the album for the given artist to the database."
  ; for backwards compatibility it is expected that the
  ; album param is a map,
  ; {:artist_id :release_date :album_name :artist_name}
  ; As such we'll have to rename the :album_name key and remove
  ; the :artist_name. This is because korma will attempt to use all
  ; keys in the map when inserting, and :artist_name will destroy
  ; us with rabid vitriol.
  [album]
  (let [album (->
                (clojure.set/rename-keys album {:album_name :name})
                (dissoc :artist_name)
                (assoc :release_date
                       (k/sqlfn date (:release_date album))))]
    (k/insert albums (k/values album))))


(defn update-album<!
  "Updates the album for the given artist to the database."
  [album]
  (let [album (->
                (clojure.set/rename-keys album {:album_name :name})
                (dissoc :artist_name)
                (assoc :release_date
                       (k/sqlfn date (:release_date album))
                       :album_id (Integer/parseInt (:album_id album))
                       )
                )]
    (k/update albums
              (k/set-fields album)
              (k/where {:album_id (:album_id album)}))))


;-- name: insert-song<!
;-- Adds the song for the given album to the database
;
; INSERT INTO songs (album_id, name, track_number, youtube_link)
; VALUES (:album_id, :name, :track_number, :youtube_link)
(defn insert-song<!
  "Adds the song for the given album to the database."
  ; for backwards compatibility it is expected that the
  ; song param is a map,
  ; {:album_id :youtube_link :track_number :song_name :album_name}
  ; As such we'll have to rename the :song_name key and remove
  ; the :album_name. This is because korma will attempt to use all
  ; keys in the map when inserting, and :album_name will destroy
  ; us with rabid vitriol.
  [song]
  (let [song (->
               (clojure.set/rename-keys song {:song_name :name})
               (dissoc :album_name))]
    (k/insert songs (k/values song)))
  )


; -- name: get-albums-by-name
; -- Fetches the specific album from the database for a particular
; -- artist.
; SELECT a.*
; FROM albums a
; WHERE
;       artist_id = :artist_id and
;       name = :album_name
(defn get-albums-by-name-and-id
  "Fetches the specific album from the database for a particular artist."
  ; for backwards compatibility it is expected that the
  ; album param is {:artist_id :artist_name}
  [album]
  (first
    (k/select albums
            (k/where {:artist_id (:artist_id album)
                      :name (:artist_name album)}))))


(defn get-albums-by-artist-name
  "Fetches the specific album from the database for a particular artist."
  ; for backwards compatibility it is expected that the
  ; album param is {:artist_name}
  [album]
  (first
    (k/select albums
              (k/where {:name (:artist_name album)}))))

(defn get-albums-by-name
  "Fetches the specific album from the database with the given name."
  ; for backwards compatibility it is expected that the
  ; album param is {:artist_name}
  [album]
  (first
    (k/select albums
              (k/where {:name (:album_name album)}))))

(defn get-album-by-id
  "Fetches the specific album from the database with the given id."
  ; for backwards compatibility it is expected that the
  ; album param is {:artist_name}
  [album]
  (first
    (k/select albums
              (k/join artists)
              (k/fields :albums.album_id [:albums.name :album_name] :artists.artist_id
                        [:artists.name :artist_name] :albums.release_date :albums.genre)
              (k/where {:album_id (Integer/parseInt (:album_id album))}))))

;(k/select albums
;          (k/join artists)
;          ; for backwards compatibility we need to rename the :albums.name
;          ; field to :album_name
;          (k/fields :albums.album_id [:albums.name :album_name] :albums.release_date)
;          (k/where {:artists.name (:artist artist)})
;          (k/order :release_date :DESC)))

(defn get-last-track-number
  "Gets the last track number of an album"
  [album]
  (first
    (k/select songs
              (k/fields :songs.track_number)
              (k/with albums (k/fields [:albums.name :album_name]))
              (k/where {:albums.name (:name album)})
              (k/order :track_number :DESC)))
  )

(defn inc-last-track-number
  "Adds 1 to the track number"
  [album]
  (if (nil? (get-last-track-number album))
    1
    (inc (:track_number (get-last-track-number album))))
  )

; -- name: insert-artist<!
; -- Inserts a new artist into the database. ; INSERT INTO artists(name)
; VALUES (:artist_name)
(defn insert-artist<!
  "Inserts a new artist into the database."
  ; for backwards compatibility it is expected that the
  ; artist param is {:artist_name}
  [artist]
  (let [artist (clojure.set/rename-keys
                 artist {:artist_name :name})]
    (k/insert artists (k/values artist))))


; -- name: get-artists-by-name
; -- Retrieves an artist from the database by name. ; SELECT *
; FROM artists
; WHERE name=:artist_name
(defn get-artists-by-name
  "Retrieves an artist from the database by name."
  ;for backwards compatibility it is expected that the
  ; artist_name param is {:artist_name}
  [artist_name]
  (first
    (k/select artists
            (k/where {:name (:artist_name artist_name)}))))


;(defn add-album!
;  "Adds a new album to the database."
;  ([album]
;       (jdbc/with-db-transaction [tx db-spec]
;            (add-album! album tx)))
;  ([album tx]
;       (let [artist-info {:artist_name (:artist_name album)}
;             txn {:connection tx}
;             ; fetch or insert the artist record
;             artist (or (first (get-artists-by-name artist-info txn))
;                        (insert-artist<! artist-info txn))
;             album-info (assoc album :artist_id (:artist_id artist))]
;         (or (first (get-albums-by-name album-info txn))
;             (insert-album<! album-info txn)))))

(defn add-album!
  "Adds a new album to the database."
  [album]
  (db/transaction
    (let [artist-info {:artist_name (:artist_name album)}
          ; fetch or insert the artist record
          artist (or (get-artists-by-name artist-info)
                     (insert-artist<! artist-info))
          album-info (assoc album :artist_id (:artist_id artist))]
      (or (get-albums-by-name-and-id album-info)
          (insert-album<! album-info))
    )
  )
)

(defn add-new-info-for-album!
  "Updates an album to the database."
  [album]
  (db/transaction
    (let [artist-info {:artist_name (:artist_name album)}
          ; fetch or insert the artist record
          artist (or (get-artists-by-name artist-info)
                     (insert-artist<! artist-info))
          album-info (assoc album :artist_id (:artist_id artist))]
      (update-album<! album-info)
      ;(println album-info)
    )
  )
)

(defn add-song!
  "Adds a new song to the database."
  [song]
  (db/transaction
    (let [album-info {:album_name (:album_name song)}
          ; fetch or insert the artist record
          album (get-albums-by-name album-info)
          track-number (inc-last-track-number album)
          song-info (assoc song :album_id (:album_id album)
                                :track_number track-number)]
      (or (get-album-songs-with-fields song-info)
          (insert-song<! song-info))
      )
    )
  )

(defn delete-album
  "Deletes album with the given name.
  The album_id has to be manually cast to Integer,
  because of some issues with the WHERE clause."
  [album_id]
    (k/delete albums
              (k/where {:album_id (Integer/parseInt (:album_id album_id))}))
  ;(println (type (Integer/parseInt (:album_id album_id))))
  )

(defn delete-song
  "Deletes song with the given name.
  The song_id has to be manually cast to Integer,
  because of some issues with the WHERE clause."
  [song_id]
    (k/delete songs
              (k/where {:song_id (Integer/parseInt (:song_id song_id))}))
  )