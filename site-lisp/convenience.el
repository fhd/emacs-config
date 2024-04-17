;; TODO: Test marginalia.
;; TODO: Test safehist to safe minibuffer history.

(global-auto-revert-mode)

(use-package recentf
  :config (recentf-mode))

(use-package repeat
  :config (repeat-mode))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
	 ("M-g o" . consult-outline)))

(use-package vertico
  :ensure t
  :config (vertico-mode))

(use-package orderless
  :ensure t
  :config (setq completion-styles '(orderless basic)))

(provide 'convenience)
