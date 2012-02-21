(setq emacs-d "~/.emacs.d/")

(add-to-list 'load-path emacs-d)
(require 'global)
(require 'commands)
(require 'hooks)
(require 'packages)

(server-start)
