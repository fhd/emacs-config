;; TODO: Add paredit or smartparens.

(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  ;; TODO: Neither TAB nor M-TAB work, using corfu-auto as a fallback.
  (setq corfu-auto 1))

(use-package treemacs
  :ensure t
  :defer t
  :config (treemacs-project-follow-mode))

(provide 'programming)
