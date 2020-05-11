(ns hipstr.routes.albums
  (:require [compojure.core :refer :all]
            [hipstr.layout :as layout]
            [hipstr.models.album_model :as album]
            ))

(defn recently-added-page
  "Renders out the recently-added page."
  []
  (layout/render "albums/recently-added.html"
    {:albums (album/get-recently-added)}))

(defn artist-page
  "Renders out the artist page."
  [artist_name]
  (layout/render "albums/artist.html"
    {:artist artist_name
     :albums (album/get-artist-albums {:artist_name artist_name})}))

(defroutes album-routes
  (GET "/albums/recently-added" [] (recently-added-page))
  (GET "/albums/:artist_name" [artist_name] (artist-page artist_name))
)