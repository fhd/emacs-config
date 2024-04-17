;; TODO: Add paredit or smartparens.

(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  ;; TODO: Neither TAB nor M-TAB work, using corfu-auto as a fallback.
  (setq corfu-auto 1))

(use-package treemacs
  :ensure t
  :defer t)

;; TODO: Consider switching to project.el.
(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile)
  :config (treemacs-project-follow-mode))

(provide 'programming)
