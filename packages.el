(add-to-list 'load-path (concat emacs-d "site-lisp"))

;; package.el
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("marmalade" .
                                 "http://marmalade-repo.org/packages/"))

;; org-mode
(setq org-directory "~/org/")
(setq org-hide-leading-stars t)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)

;; color-theme
(require 'color-theme)
(color-theme-charcoal-black)

;; markdown-mode
(add-to-list 'auto-mode-alist '("\.md$" . markdown-mode))

;; jade-mode
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\.jade$" . jade-mode))

;; groovy-mode
(require 'groovy-mode)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; actionscript-mode
(require 'actionscript-mode)
(add-to-list 'auto-mode-alist '("\.as$" . actionscript-mode))

;; clojure-mode for clojurescript
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; puppet-mode
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; vala-mode
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;; ruby-mode for Gemfile and Vagrantfile
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; mustache-mode
(require 'mustache-mode)
(setq tpl-basic-offset 4)
(defalias 'mustache-mode 'tpl-mode)
(add-to-list 'auto-mode-alist '("\\.mustache$" . mustache-mode))

;; php-mode
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; css-mode for .qss
(add-to-list 'auto-mode-alist '("\\.qss$" . css-mode))

;; c-header-guess-mode for .h files
(require 'c-header-guess-mode)
(add-to-list 'auto-mode-alist '("\\.h$" . c-header-guess-mode))

;; cmake-mode
(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))

;; objc-mode for .mm
(add-to-list 'auto-mode-alist '("\\.mm$" . objc-mode))

(provide 'packages)
