(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  ;; TODO: Neither TAB nor M-TAB work, using corfu-auto as a fallback.
  (setq corfu-auto 1))

(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :bind (:map smartparens-mode-map ("M-(" . sp-wrap-round))
  :config
  (require 'smartparens-config))

(use-package treemacs
  :ensure t
  :defer t
  :config (treemacs-project-follow-mode))

(provide 'programming)