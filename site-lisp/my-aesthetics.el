(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))

(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

;; TODO: Looks a wee bit ugly with all those soft wrap markers and no margin.
(use-package visual-fill-column
  :ensure t
  :config (global-visual-fill-column-mode))

(provide 'my-aesthetics)
