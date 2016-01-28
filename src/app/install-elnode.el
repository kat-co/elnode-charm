:;exec emacs -batch -l   "$0" -f install-elnode "$@" --no-site-file -q  # -*- Emacs-Lisp -*-
;;     @emacs -batch -l "%~f0" -f install-elnode  %*  --no-site-file -q  & goto :EOF

(require 'cl-lib)
(require 'package)

(defun install-elnode()
  (setup-packaging)

  (status-set "Ensuring elnode is installed...")
  (package-install 'elnode))

(defun setup-packaging ()
  (status-set "Setting up emacs packaging system...")
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
  (package-refresh-contents))

(cl-defun status-set (message &key (status "maintenance"))
  "Calls the Juju status-set command with an optional maintenance."
  (shell-command (format "status-set %s \"%s\"" status message)))

;;:EOF
