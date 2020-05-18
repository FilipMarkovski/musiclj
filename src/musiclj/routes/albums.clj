(ns musiclj.routes.albums
  (:require [compojure.core :refer :all]
            [musiclj.layout :as layout]
            [musiclj.models.album_model :as album]
            [musiclj.validators.album_validator :as v]
            [taoensso.timbre :as timbre]
            [noir.util.route :refer [restricted]]
            ))


(defn render-recently-added-html
  "Simply renders the recently added page with the given context."
  [ctx]
  (layout/render "albums/recently-added.html" ctx))

(defn recently-added-page
  "Renders out the recently-added page."
  []
  (render-recently-added-html {:albums (album/get-recently-added)}))

(defn artist-page
  "Renders out the artist page."
  [artist_name]
  (layout/render "albums/artist.html"
    {:artist artist_name
     :albums (album/get-artist-albums {:artist artist_name})}))

(defn album-page
  "Renders out the album track list page."
  [album_name]
  (layout/render "songs/album_tracks.html"
                 {:album album_name
                  :songs (album/get-album-songs {:album album_name})})
)

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

(defroutes album-routes
  (GET "/albums/recently-added"   []              (restricted (recently-added-page)))
  (GET "/albums/:artist_name"     [artist_name]   (artist-page artist_name))
  (GET "/album/:album_name"       [album_name]    (album-page album_name))
  (POST "/albums/recently-added"  [& album-form]  (restricted (recently-added-submit album-form)))
)