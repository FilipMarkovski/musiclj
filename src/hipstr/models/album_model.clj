(ns hipstr.models.album_model
  (:require [yesql.core :refer [defqueries]]
            [hipstr.models.connection :refer [db-spec]]
            ))

(defqueries "hipstr/models/albums.sql"
            { :connection db-spec })