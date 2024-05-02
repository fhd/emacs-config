(global-auto-revert-mode)

;; TODO: Only for text-mode and prog-mode derived modes.
(column-number-mode)

(use-package recentf
  :config (recentf-mode))

(use-package savehist
  :config (savehist-mode))

(use-package repeat
  :config (repeat-mode))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("M-g o" . consult-outline)))

(use-package vertico
  :ensure t
  :config (vertico-mode))

(use-package marginalia
  :ensure t
  :config (marginalia-mode))

(use-package orderless
  :ensure t
  :config (setq completion-styles '(orderless basic)))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; TODO: Install magit (or whatever made rebasing so nice in Prelude)

(provide 'my-convenience)
