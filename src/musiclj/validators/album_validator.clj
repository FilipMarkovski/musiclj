(ns musiclj.validators.album_validator
  (:require [validateur.validation :refer :all]
            [noir.validation :as v]
            [clj-time.core :as t]
            [clj-time.format :as f]))

(def artist-name-validations
  "Returns a validation set, ensuring an artist name is valid."
  (validation-set
    (length-of :artist_name :within (range 1 256)
               :message-fn (fn [type m attributes & args]
                             (if (= type :blank)
                                "Artist name is required."
                                "Artist name must be less than 255
                                characters long.")))))

(def album-name-validations
  (validation-set
    (length-of :album_name :within (range 1 256)
               :message-fn (fn [type m attributes & args]
                             (if (= type :blank)
                                "Album name is required."
                                "Album name must be less than 255
                                characters long.")))))

(def genre-name-validations
  "Returns a validation set, ensuring a genre name is valid."
  (validation-set
    (length-of :genre :within (range 1 256)
               :message-fn (fn [type m attributes & args]
                             (if (= type :blank)
                               "Genre name is required."
                               "Genre name must be less than 255
                               characters long.")))))

(def release-date-format-message
  "The release date's format is incorrect. Must be yyyy-mm-dd.")

(def release-date-invalid-message
  "The release date is not a valid date.")

(def release-date-format-validator
  "Returns a validator function which ensures the format of the
  date-string is correct."
  (format-of :release_date
             :format #"^\d{4}-\d{2}-\d{2}$"
             :blank-message release-date-format-message
             :message release-date-format-message))

(def release-date-formatter (f/formatter "yyyy-mm-dd"))

(defn parse-date
  "Returns a date/time object if the provided date-string is
   valid; otherwise nil."
  [date]
  (try
    (f/parse release-date-formatter date)
    (catch Exception e)))

(def release-date-validator
  "Returns a validator function which ensures the provided
   date-string is a valid date."
  (validate-when #(valid? (validation-set
                            release-date-format-validator) %)
                 (validate-with-predicate :release_date
                                          #(v/not-nil? (parse-date (:release_date %)))
                                          :message release-date-invalid-message)))


(def song-name-validations
  "Returns a validation set, ensuring a song name is valid."
  (validation-set
    (length-of :name :within (range 1 256)
               :message-fn (fn [type m attributes & args]
                             (if (= type :blank)
                               "Song name is required."
                               "Song name must be less than 255
                               characters long.")))))

(def youtube-link-format-message
  "The release date's format is incorrect. Must be yyyy-mm-dd.")

(def youtube-link-validations
  "Returns a validator function which ensures the format of the
   youtube-string is correct."
  (format-of :youtube_link
             :format #"/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=|\?v=)([^#\&\?]*).*/"
             :blank-message youtube-link-format-message
             :message youtube-link-format-message))

(def release-date-validations
  "Returns a validator which, when the format of the date-string
   is correct, ensures the date itself is valid."
  (validation-set release-date-format-validator
                  release-date-validator))

(def validate-new-album
  "Returns a validator that knows how to validate all the fields
   for a new album."
  (compose-sets artist-name-validations
                album-name-validations
                genre-name-validations
                release-date-validations))

(def validate-new-song
  "Returns a validator that knows how to validate all the fields
   for a new song."
  (compose-sets song-name-validations
                ))