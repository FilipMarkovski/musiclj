(ns musiclj.models.connection
  (:require [environ.core :refer [env]]
            [korma.db :as db]))

(def db-spec {:classname   (env :db-classname)
              :subprotocol (env :db-subprotocol)
              :subname     (env :db-subname)
              :user        (env :db-user)
              :password    (env :db-password)})

; Declares the hipstr-db Korma database connection,
; which leverages our already existing db-spec
(db/defdb hipstr-db db-spec)