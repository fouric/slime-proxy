;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage #:slime-proxy-asd
  (:use :cl :asdf))

(in-package :slime-proxy-asd)

(defsystem slime-proxy
  :name "slime-proxy"
  :version "0.0.0"
  :maintainer "fouric"
  :author "fouric"
  :license "All rights reserved"
  :description "DESCRIPTION HERE"

  :serial t
  :depends-on (:usocket :usocket-server)
  :pathname "src"
  :components ((:file "package")
               (:file "client")
               (:file "server")
               (:file "proxy")
               ))
