(ns hipstr.routes.home
  (:require [compojure.core :refer :all]
            [hipstr.layout :as layout]
            [hipstr.util :as util]
            [ring.util.response :as response]
            [hipstr.validators.user_validator :as v]
            [hipstr.models.user_model :as u]
            ))

(defn home-page []
  (layout/render
    "home.html" {:content (util/md->html "/md/docs.md")}))

(defn about-page []
  (layout/render "about.html"))

(defn signup-page []
  (layout/render "signup.html"))

(defn foo-response [request]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body (str "<html><body><dt>Go bowling?</dt>"
              "<dd>" (:go-bowling? request) "</dd></body></html>")
 })

(defn signup-page-submit [user]
  (let [errors (v/validate-signup user)]
       (if (empty? errors)
         (do
            (u/add-user! user)
            (response/redirect "/signup-success")
           )
         (layout/render "signup.html" (assoc user :errors errors)))))

(defroutes home-routes
    (GET "/" [] (home-page))
    (GET "/about" [] (about-page))
    (GET "/signup" [] (signup-page))
    (POST "/signup" [& form] (signup-page-submit form))
    (GET "/signup-success" [] "Success!"))
