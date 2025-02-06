(defun my-read-auth-info-secret (host user)
  (if-let* ((auth-info (car (auth-source-search :host host :user user)))
            (secret (plist-get auth-info :secret)))
      (funcall secret)))

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
  (if-let ((secret (my-read-auth-info-secret "api.anthropic.com" "apikey")))
      (setq gptel-backend (gptel-make-anthropic "Claude" :stream t :key secret)
            gptel-model "claude-3-5-sonnet-20241022"))
  (if-let ((secret (my-read-auth-info-secret
                    "generativelanguage.googleapis.com" "apikey")))
      (gptel-make-gemini "Gemini" :stream t :key secret))
  (if-let ((secret (my-read-auth-info-secret "kagi.com" "apikey")))
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

(use-package kagi
  :ensure t
  :bind (("C-c k k" . kagi-fastgpt-prompt)
         ("C-c k s" . kagi-fastgpt-shell))
  :custom
  (kagi-api-token (lambda () (my-read-auth-info-secret "kagi.com" "apikey"))))

(provide 'my-utilities)
