(ns musiclj.routes.access
  (:require [musiclj.models.user_model :refer [is-authed?]]))

(def rules
  "The rules for accessing various routes in our application."
  [{:redirect "/login" :rule is-authed?}])

