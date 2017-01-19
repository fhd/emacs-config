;; Package.el will re-add this if it's removed rather than commented out.
;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'global)
(require 'commands)
(require 'hooks)
(require 'packages)

(server-start)
