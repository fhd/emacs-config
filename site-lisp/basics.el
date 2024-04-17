(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package vterm
  :ensure t
  :bind ("C-c t" . vterm))

(provide 'basics)
