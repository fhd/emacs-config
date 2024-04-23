;; Save backups in /tmp
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Set fill-column to 80 (except in org-mode)
(setq-default fill-column 80)
(add-hook 'org-mode-hook (lambda () (setq-local fill-column 70)))

(setq-default indent-tabs-mode nil)

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package vterm
  :ensure t
  :bind ("C-c t" . vterm))

(use-package editorconfig
  :ensure t
  :defer t
  :config (editorconfig-mode))

;; Open mailto: links in external application.
;; TODO: Find a more portable approach for this
(setq browse-url-generic-program "open")
(setq browse-url-mailto-function 'browse-url-generic)

(provide 'my-basics)
