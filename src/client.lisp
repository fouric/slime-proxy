(in-package :slime-proxy)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defparameter *client-socket* nil)
(defparameter *client-stream* nil)

(defun client-open (&optional (port 4001))
  (setf *client-socket* (socket-connect "127.0.0.1" port)
        *client-stream* (socket-stream *client-socket*)))

(defun client-send ()
  (write-line "hello server" *client-stream*)
  (finish-output *client-stream*))

(defun client-close ()
  (socket-close *client-socket*))
