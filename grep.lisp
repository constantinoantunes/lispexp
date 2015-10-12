#!/usr/bin/env clisp

(load "lang.lisp")

(defpackage :com.constantinoantunes.lispexp
  (:use :common-lisp :ext)
  (:import-from :com.constantinoantunes.lispexp.lang :foreach))

(in-package :com.constantinoantunes.lispexp)

(if (not (eq (length *args*) 2)) (progn
  (format t "Usage: grep.lisp <regex> <file>")
  (exit 1)))

(let ((regex (nth 0 *args*)) (filename (nth 1 *args*)))
  (foreach line in file filename
    (if (regexp:match regex line) (format t "~a~%" line))))
