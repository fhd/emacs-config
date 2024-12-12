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
      (gptel-make-anthropic "Claude" :stream t :key secret))
  (if-let* ((auth-info
             (auth-source-search :host "generativelanguage.googleapis.com" :user "apikey"))
            (secret (plist-get (car auth-info) :secret)))
      (gptel-make-gemini "Gemini" :stream t :key secret)))

(use-package google-this
  :ensure t
  :config
  (global-set-key (kbd "C-c /") 'google-this-mode-submap))

(provide 'my-utilities)
