(let ((required-version 29))
 (when (< emacs-major-version required-version)
   (error "Emacs %s or greater needed" required-version)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Save customize variables in a separate file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

(add-to-list 'load-path (locate-user-emacs-file "site-lisp"))
(require 'my-basics)
(require 'my-aesthetics)
(require 'my-convenience)
(require 'my-programming)
(require 'my-file-types)
(require 'my-org)
(require 'my-utilities)
