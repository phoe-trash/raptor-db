;;;; raptor-db.lisp

(in-package #:raptor-db)

(defvar *store-location* "~/.raptor-db")

(defun initialize ()
  (close-store)
  (make-instance 'mp-store :directory *store-location*))

(define-persistent-class db-character ()
    ((name :read :index-type string-unique-index
                 :index-reader db-character-with-name
                 :index-values all-db-characters)
     (data :update :initform nil)
     (website :update :initform nil)))

(defun db-create (name data)
  (make-instance 'db-character :name name :data data :website nil))

(defun db-retrieve (name)
  (db-character-with-name name))

(defun db-update-data (name data)
  (let ((character (db-character-with-name name)))
    (with-transaction ()
      (setf (db-character-data character) data))))

(defun db-delete (name)
  (if-let ((character (db-character-with-name name)))
    (delete-object character)))
