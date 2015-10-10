#!/usr/bin/env clisp

(if (not (eq (length *args*) 2)) (progn
  (format t "Usage: grep.lisp <regex> <file>")
  (exit 1)))

(let ((regex (nth 0 *args*)) (fh (open (nth 1 *args*))))
  (when fh
    (loop for line = (read-line fh nil)
      while line do
      (let ((match (regexp:match regex line)))
        (if (not (eq match nil)) (format t "~a~%" line))))
    (close fh)))
