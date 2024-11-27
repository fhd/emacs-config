(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t)
  (let ((color "#2f3855"))
    (set-face-attribute 'fill-column-indicator
                        nil :height 1 :foreground color :background color)))

(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

;; TODO: Looks a wee bit ugly with all those soft wrap markers and no margin.
(use-package visual-fill-column
  :ensure t
  :config (global-visual-fill-column-mode))

(provide 'my-aesthetics)
