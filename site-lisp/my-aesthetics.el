(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t)
  (let ((color "#2f3855"))
    (set-face-attribute 'fill-column-indicator
                        nil :height 1 :foreground color :background color)))

;; Bit of a hack, for reasons I haven't figured out yet, the font in macOS is
;; smaller.
(if (not (eq system-type "darwin")
 (set-face-attribute 'default nil :height 95)))

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

;; TODO: Find a way to show the entire mode line, with or without
;; smart-mode-line.
(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup))

(provide 'my-aesthetics)
