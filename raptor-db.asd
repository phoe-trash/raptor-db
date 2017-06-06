;;;; raptor-db.asd

(asdf:defsystem #:raptor-db
  :description "Describe raptor-db here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :serial t
  :depends-on (:bknr.datastore
               :bknr.indices
               :alexandria)
  :components ((:file "package")
               (:file "raptor-db")))
