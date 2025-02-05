(use-package gptel
  :ensure t
  :bind (("C-c g g" . gptel)
         ("C-c g s" . gptel-send)
         ("C-c g r" . gptel-rewrite)
         ("C-c g a" . gptel-add)
         ("C-c g m" . gptel-menu)
         ("C-c g p" . my-gptel-prompt))
  :config
  (setq gptel-default-mode 'org-mode)
  (if-let* ((auth-info
             (auth-source-search :host "api.anthropic.com" :user "apikey"))
            (secret (plist-get (car auth-info) :secret)))
      (setq gptel-backend (gptel-make-anthropic "Claude" :stream t :key secret)
            gptel-model "claude-3-5-sonnet-20241022"))
  (if-let* ((auth-info
             (auth-source-search :host "generativelanguage.googleapis.com" :user "apikey"))
            (secret (plist-get (car auth-info) :secret)))
      (gptel-make-gemini "Gemini" :stream t :key secret))
  (if-let* ((auth-info
             (auth-source-search :host "kagi.com" :user "apikey"))
            (secret (plist-get (car auth-info) :secret)))
      (gptel-make-kagi "Kagi" :key secret))

  (defun my-gptel-prompt ()
    (interactive)
    (let ((prompt (read-string "Enter prompt: "))
          (text (when (region-active-p)
                  (buffer-substring-no-properties (region-beginning) (region-end)))))
      (unless (string-empty-p prompt)
        (message "Querying %s..." (gptel-backend-name gptel-backend))
        (gptel-request (if text
                           (concat prompt "\n\n" text)
                         prompt)
          :callback
          (lambda (response info)
            (when response
              (let ((buffer-name (format "*%s Response*" (gptel-backend-name gptel-backend))))
                (with-temp-buffer-window
                    buffer-name
                    '(display-buffer-in-side-window
                      (side . bottom)
                      (slot . 0))
                    (lambda (window _value)
                      (with-selected-window window
                        (local-set-key "q" #'kill-buffer-and-window)))
                  (princ response))
                (select-window (get-buffer-window buffer-name))))))))))

(use-package google-this
  :ensure t
  :config
  (global-set-key (kbd "C-c /") 'google-this-mode-submap))

(provide 'my-utilities)
