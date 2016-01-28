:;exec emacs -nw -l "$0" --eval "(serve-site $@)" < /dev/tty  # -*- Emacs-Lisp -*-
;;     @emacs -nw -l "%~f0" --eval "(serve-site %*)" & goto :EOF

(require 'cl-lib)
(require 'package)
(package-initialize)
(require 'elnode)

(cl-defun serve-site(&key (docroot "./www")
                          (port 8000))
  (status-set (format "Serving directory \"%s\" port %d" docroot port))
  (elnode-make-webserver docroot port))

(cl-defun status-set (message &key (status "maintenance"))
  "Calls the Juju status-set command with an optional maintenance."
  (shell-command (format "status-set %s \"%s\"" status message)))

;;:EOF
