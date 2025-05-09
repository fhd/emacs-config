(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t)
  ;; TODO: Set these more systematically based on existing theme colours.
  (let ((color "#2f3855"))
    (set-face-attribute 'fill-column-indicator nil
                        :height 1 :foreground color :background color))
  ;; TODO: This seems pretty hacky.
  (with-eval-after-load 'vterm
   (copy-face 'highlight 'vterm-color-bright-black)))

(if (not (eq system-type 'darwin))
 (set-face-attribute 'default nil :height 95))

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
;; (use-package smart-mode-line
;;   :ensure t
;;   :config
;;   (setq sml/no-confirm-load-theme t)
;;   (setq sml/theme 'respectful)
;;   (sml/setup))

;; Needs (nerd-icons-install-fonts).
(use-package doom-modeline
  :ensure t
  :config (doom-modeline-mode))

(provide 'my-aesthetics)
