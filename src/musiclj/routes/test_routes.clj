(ns musiclj.routes.test_routes
  (:require [compojure.core :refer :all]))


(defn render-request-val [request-map & [request-key]]
  "Simply returns the value of request-key in request-map,
  if request-key is provided; Otherwise return the request-map.
  If request-key is provided, but not found in the request-map,
  a message indicating as such will be returned."

  (str (if request-key
         (if-let [result ((keyword request-key) request-map)]
           result
           (str request-key " is not a valid key."))
          request-map)))

(defroutes test-routes
   (POST "/req" request (render-request-val request))
   ; no access to the full request map
   (GET "/req/:val" [val] (str val))
   ; use :as to get access to full request map
   (GET "/req/:val" [val :as full-req] (str val "<br>" full-req))
   ; use & to get access to the remainder of unbound symbols
   (GET "/req/:val/:another-val/:and-another" [val & remainders] (str val "<br>" remainders))
   ; use :as to get access to unbound params, and call our route
   ; handler function
   (GET "/req/key/:key" [key :as request]
     (render-request-val request key)))