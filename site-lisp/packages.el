;; package.el
(when (< emacs-major-version 24)
  (load-file "~/.emacs.d/site-lisp/packages/package.el"))
(package-initialize)
(add-to-list 'package-archives '("marmalade" .
                                 "http://marmalade-repo.org/packages/"))

;; org-mode
(setq org-directory "~/org/")
(setq org-hide-leading-stars t)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)

;; color-theme
(when (< emacs-major-version 24)
  (require 'color-theme)
  (color-theme-charcoal-black))

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

;; groovy-mode for .gradle files
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))

;; actionscript-mode
(load-file "~/.emacs.d/site-lisp/packages/actionscript-mode.el")
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

;; php-mode
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; css-mode for .qss
(add-to-list 'auto-mode-alist '("\\.qss$" . css-mode))

;; c-header-guess-mode for .h files
(load-file "~/.emacs.d/site-lisp/packages/c-header-guess-mode.el")
(add-to-list 'auto-mode-alist '("\\.h$" . c-header-guess-mode))

;; cmake-mode
(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))

;; objc-mode for .mm
(add-to-list 'auto-mode-alist '("\\.mm$" . objc-mode))

;; js-mode
(load-file "~/.emacs.d/site-lisp/packages/js.el")
(add-to-list 'auto-mode-alist '("\\.jsm$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.gyp$" . js-mode))

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; lua-mode
(load-file "~/.emacs.d/site-lisp/packages/lua-mode.el")
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

;; xml-mode for xul
(add-to-list 'auto-mode-alist '("\\.xul$" . nxml-mode))

;; web-mode for html et al
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; java-mode-indent-annotations
(load-file "~/.emacs.d/site-lisp/packages/java-mode-indent-annotations.el")

;; editorconfig
(add-to-list 'load-path "~/.emacs.d/site-lisp/packages/editorconfig-0.7.8")
(require 'editorconfig)
(editorconfig-mode 1)

(provide 'packages)
