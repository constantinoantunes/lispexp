#!/usr/bin/env clisp

(if (not (eq (length *args*) 2)) (progn
  (format t "Usage: grep.lisp <regex> <file>")
  (exit 1)))

(defmacro foreach (line in file filename &rest body)
  `(let ((file_handle (open ,filename)))
    (when file_handle (loop for ,line = (read-line file_handle nil)
      while ,line do ,@body))
    (close file_handle)))

(let ((regex (nth 0 *args*)) (filename (nth 1 *args*)))
  (foreach line in file filename
    (if (regexp:match regex line) (format t "~a~%" line))))
