;;;; package.lisp

(defpackage #:raptor-db
  (:shadowing-import-from #:bknr.indices #:array-index)
  (:use #:cl
        #:alexandria
        #:bknr.datastore
        #:bknr.indices))
