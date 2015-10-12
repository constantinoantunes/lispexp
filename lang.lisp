
(defpackage :com.constantinoantunes.lispexp.lang (:use :common-lisp))

(in-package :com.constantinoantunes.lispexp.lang)

(defmacro foreach (line in file filename &rest body)
  `(let ((file_handle (open ,filename)))
    (when file_handle (loop for ,line = (read-line file_handle nil)
      while ,line do ,@body))
    (close file_handle)))
