(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  ;; TODO: Neither TAB nor M-TAB work, using corfu-auto as a fallback.
  (setq corfu-auto 1))

(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-strict-mode)
  :bind (:map smartparens-mode-map
	 ("M-(" . sp-wrap-round)
	 ("M-S-<backspace>" . sp-backward-unwrap-sexp))
  :config
  (require 'smartparens-config))

(use-package treemacs
  :ensure t
  :defer t
  :config (treemacs-project-follow-mode))

(use-package yaml-mode
  :ensure t
  :defer t)

(provide 'programming)
