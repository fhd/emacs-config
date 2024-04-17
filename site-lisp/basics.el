;; Save backups in /tmp
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Set fill-column to 80 (except in org-mode)
(setq-default fill-column 80)
(add-hook 'org-mode-hook (lambda () (setq-local fill-column 70)))

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package vterm
  :ensure t
  :bind ("C-c t" . vterm))

(provide 'basics)
