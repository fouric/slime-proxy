(defun start-swank ()
  (asdf:load-system :swank)
  (funcall (intern "CREATE-SERVER" :swank) :port 4005 :dont-close t)
  (loop (sleep 1)))
