(let ((required-version 29))
 (when (< emacs-major-version required-version)
   (error "Emacs %s or greater needed" required-version)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Save customize variables in a separate file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; Basics

(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package vterm
  :ensure t
  :bind ("C-c t" . vterm))

;;; Visual

(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))

;;; Convenience

(use-package recentf
  :config (recentf-mode))

(use-package repeat
  :config (repeat-mode))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
	 ("M-g o" . consult-outline)))

(use-package vertico
  :ensure t
  :config (vertico-mode))

(use-package orderless
  :ensure t
  :config (setq completion-styles '(orderless basic)))

;; TODO: Test marginalia.
;; TODO: Test safehist to safe minibuffer history.

;;; Programming

(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  ;; TODO: Neither TAB nor M-TAB work, using corfu-auto as a fallback.
  (setq corfu-auto 1))

(use-package treemacs
  :ensure t
  :defer t)

;; TODO: Consider switching to project.el.
(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile)
  :config (treemacs-project-follow-mode))

;; TODO: Add paredit or smartparens.

;;; File types

(use-package markdown-mode
  :ensure t
  :defer t)

(use-package csv-mode
  :ensure t
  :defer t)
