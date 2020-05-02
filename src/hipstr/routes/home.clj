(ns hipstr.routes.home
  (:require [compojure.core :refer :all]
            [hipstr.layout :as layout]
            [hipstr.util :as util]))

(defn home-page []
  (layout/render
    "home.html" {:content (util/md->html "/md/docs.md")}))

(defn about-page []
  (layout/render "about.html"))

(defn foo-response []
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "<html><body><h1>Hello World!</h1></body></html>"})

(defroutes home-routes
  (GET "/" [] (home-page))
  ;(GET "/about" [] (about-page))
  (GET "/about" [] (foo-response))

 )
