;; Save backups in /tmp
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Set fill-column to 80 (except in org-mode)
(setq-default fill-column 80)
(add-hook 'org-mode-hook (lambda () (setq-local fill-column 70)))

(setq-default indent-tabs-mode nil)

(setq tab-always-indent 'complete)

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

;; TODO: Text killed in vterm can't be yanked again.
(use-package vterm
  :ensure t
  :bind ("C-c t" . vterm))

(use-package editorconfig
  :ensure t
  :config (editorconfig-mode))

;; Open mailto: links in external application.
(setq browse-url-generic-program "open")
(setq browse-url-mailto-function 'browse-url-generic)

(tool-bar-mode -1)

(provide 'my-basics)
