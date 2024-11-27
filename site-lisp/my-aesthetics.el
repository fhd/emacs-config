(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t)
  (let ((color "#2f3855"))
    (set-face-attribute 'fill-column-indicator
                        nil :height 1 :foreground color :background color)))

(set-face-attribute 'default nil :height 95)

(global-visual-line-mode)

(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

(use-package olivetti
  :ensure t
  :hook ((text-mode . olivetti-mode)
         (prog-mode . olivetti-mode))
  :config (setq-default olivetti-body-width 100))

(use-package adaptive-wrap
  :ensure t
  :after olivetti
  :hook ((olivetti-mode . adaptive-wrap-prefix-mode)))

(provide 'my-aesthetics)
