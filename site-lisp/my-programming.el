(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  (setq corfu-auto t)
  (setq corfu-popupinfo-delay '(1.0 . 0.5))
  (corfu-popupinfo-mode t)
  (corfu-history-mode t)
  (with-eval-after-load 'savehist
    (add-to-list 'savehist-additional-variables 'corfu-history)))

(use-package smartparens
  :ensure t
  :hook ((lisp-data-mode . smartparens-strict-mode)
         (clojure-mode . smartparens-strict-mode)
         (comint-mode . smartparens-strict-mode)
         (cider-repl-mode . smartparens-strict-mode))
  :bind (:map smartparens-mode-map
              ("M-(" . sp-wrap-round)
              ("M-[" . sp-wrap-square)
              ("M-{" . sp-wrap-curly)
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
