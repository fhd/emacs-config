(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  ;; TODO: Neither TAB nor M-TAB work, using corfu-auto as a fallback.
  (setq corfu-auto 1))

;; TODO: Disable angle brackets as pairs in js-mode, web-mode, possibly others.
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

(use-package slime
  :ensure t
  :defer t
  :config
  ;; Use Roswell for SLIME
  ;; TODO: Maybe move this to dir-locals, feels wrong to hard code.
  (load (expand-file-name "~/.roswell/helper.el"))
  (add-to-list 'slime-lisp-implementations '(roswell ("ros" "-Q" "run")))
  (setq slime-default-lisp 'roswell))

(use-package cider
  :ensure t
  :defer t)

(provide 'my-programming)
