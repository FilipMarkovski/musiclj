(ns musiclj.routes.albums
  (:require [compojure.core :refer :all]
            [ring.util.response :as response]
            [musiclj.layout :as layout]
            [musiclj.models.album_model :as album]
            [musiclj.validators.album_validator :as v]
            [taoensso.timbre :as timbre]
            [noir.util.route :refer [restricted]]
            ))

(def not-nil? (complement nil?))

(defn render-recently-added-html
  "Simply renders the recently added page with the given context."
  [ctx]
  (layout/render "albums/recently-added.html" ctx))

(defn recently-added-page
  "Renders out the recently-added page."
  []
  (render-recently-added-html {:albums (album/get-recently-added)
                               :artists (map :name (album/get-artists))}))

(defn artist-page
  "Renders out the artist page."
  [artist_name]
  (layout/render "albums/artist.html"
    {:artist artist_name
     :albums (album/get-artist-albums {:artist artist_name})}))

(defn render-album-page-html
  "Simply renders the album page with the given context."
  [ctx]
  (layout/render "songs/album-tracks.html" ctx)
)

(defn album-page
  "Renders out the album track list page."
  [album_name]
  (render-album-page-html {:album album_name
                           :songs (album/get-album-songs {:album_name album_name})}))

(defn recently-added-submit
  "Handles the add-album form on the recently-added page.
   In the case of validation errors or other unexpected errors,
   the :new key in the context will be set to the album
   information submitted by the user."
  [album]
  (let [errors (v/validate-new-album album)
        form-ctx (if (not-empty errors)
                   {:validation-errors errors :new album}
                   (try
                     (album/add-album! album)
                     {:new {} :success true}
                     (catch Exception e
                        (timbre/error e)
                        {:new album
                         :error "Oh snap! We lost the album. Try it again?"})))
        ctx (merge {:form form-ctx}
                   {:albums (album/get-recently-added)})]
    (render-recently-added-html ctx)))


(defn render-recently-added-on-delete-album
  "Handles the delete-album fn on the recently-added page."
  [album_id]
  (if (not-nil? album_id)
    (do (try
          (album/delete-album {:album_id album_id})
          (catch Exception e
            (timbre/error e)))
        (response/redirect "/albums/recently-added"))
    (render-recently-added-html {:albums (album/get-recently-added)}))
)


(defn song-submit
  "Handles the add-song form on the album page.
   In the case of validation errors or other unexpected errors,
   the :new key in the context will be set to the song
   information submitted by the user."
  [song]
  (let [errors (v/validate-new-song song)
        form-ctx (if (not-empty errors)
                   {:validation-errors errors :new song}
                   (try
                     (album/add-song! song)
                     {:new {} :success true}
                     (catch Exception e
                        (timbre/error e)
                        {:new song
                         :error "Oh snap! We lost the song. Try it again?"})))
        ctx (merge {:form form-ctx}
              {:album (:album_name song)
               :songs (album/get-album-songs {:album_name (:album_name song)})})]
    (render-album-page-html ctx))
  )


(defroutes album-routes
  (GET      "/albums/recently-added"    []              (restricted (recently-added-page)))
  (GET      "/albums/:artist_name"      [artist_name]   (artist-page artist_name))
  (GET      "/album/:album_name"        [album_name]    (album-page album_name))
  (GET      "/album/:album_id/delete"   [album_id]      (restricted (render-recently-added-on-delete-album album_id)))
  (POST     "/albums/recently-added"    [& album-form]  (restricted (recently-added-submit album-form)))
  (POST     "/album/:album_name"        [& song-form]   (restricted (song-submit song-form)))
)