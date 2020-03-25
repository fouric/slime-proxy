(in-package :slime-defun-proxy)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defun copy-to-out (in-stream)
  (declare (type in-stream stream))
  (let (char
        line)
    (loop :named inner :do
      (progn
        (setf char (read-char in-stream nil 'eof))
        (when (eq char 'eof)
          (socket-close *in-socket*)
          (return-from inner))
        (push char line)
        (write-char char *out-stream*)
        (finish-output *out-stream*)
        (when (char= char #\newline)
          (finish-output *out-stream*)
          (return-from inner))))
    (format t "line passed: ~a~%" (coerce (nreverse line) 'string))))

(defparameter *out-socket* nil)
(defparameter *out-stream* nil)
(defparameter *in-socket* nil)

(defun proxy (&optional (client-port 4001) (server-port 4002))
  (setf *out-socket* (socket-connect "127.0.0.1" server-port))
  (setf *out-stream* (socket-stream *out-socket*))
  (setf *in-socket* (socket-server "127.0.0.1" client-port #'copy-to-out)))
