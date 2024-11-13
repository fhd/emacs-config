(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))

(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

(provide 'my-aesthetics)
