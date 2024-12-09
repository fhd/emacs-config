;; Skip the tutorial buffer and open scratch instead.
;;(setq initial-buffer-choice t)

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
  (unless (or (server-running-p) (daemonp))
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

(setq xref-search-program (if (executable-find "rg")'ripgrep 'grep))

;; Switch command and option on macOS
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(use-package gptel
  :ensure t
  :bind (("C-c g g" . gptel)
         ("C-c g s" . gptel-send)
         ("C-c g r" . gptel-rewrite)
         ("C-c g a" . gptel-add)
         ("C-c g m" . gptel-menu))
  :config
  (setq gptel-default-mode 'org-mode)
  (if-let* ((auth-info
             (auth-source-search :host "api.anthropic.com" :user "apikey"))
            (secret (plist-get (car auth-info) :secret)))
      (gptel-make-anthropic "Claude" :stream t :key secret)))

(use-package google-this
  :ensure t
  :config
  (global-set-key (kbd "C-c /") 'google-this-mode-submap))

(provide 'my-basics)
