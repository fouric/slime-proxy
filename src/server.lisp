(in-package :slime-proxy)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defparameter *server-socket* nil)

#++(defun default-tcp-handler (stream)
  (declare (type stream stream))
  (format t "~A~%" (read-line stream))
  (finish-output))
(defun default-tcp-handler (stream)
  (declare (type stream stream))
  (format t "~A~%" (read-line stream)))

(defun server (&optional (port 4002))
  (setf *server-socket* (socket-server "127.0.0.1" port #'default-tcp-handler)))
