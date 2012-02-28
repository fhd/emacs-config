(add-to-list 'load-path (concat emacs-d "site-lisp"))

(when
    (load
     (expand-file-name (concat emacs-d "elpa/package.el")))
  (package-initialize))

;; org-mode
(setq org-directory "~/org/")
(setq org-hide-leading-stars t)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)

;; color-theme
(require 'color-theme)
(color-theme-charcoal-black)

;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\.md$" . markdown-mode))

;; jade-mode
(require 'jade-mode)
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
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; vala-mode
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;; ruby-mode for Vagrantfile
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(provide 'packages)
