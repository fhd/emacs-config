;; Disabled because it's more annoying than helpful - especially in web-mode
;; when using tabs.
(electric-indent-mode -1)

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
  :defer t
  :hook ((lisp-data-mode . smartparens-strict-mode)
         (clojure-mode . smartparens-strict-mode)
         (slime-mode . smartparens-strict-mode)
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
  ;; Use Roswell if installed.
  (when-let ((roswell-helper "~/.roswell/helper.el")
             (_ (file-exists-p roswell-helper)))
    (load (expand-file-name roswell-helper))))

(use-package poetry
  :ensure t
  :defer t
  :hook ((python-mode . poetry-tracking-mode)))

(use-package nodejs-repl
  :ensure t
  :defer t
  :hook ((js-mode . nodejs-repl-minor-mode)))

(use-package cider
  :ensure t
  :defer t)

(use-package realgud
  :ensure t)

(use-package realgud-node-inspect
  :ensure t
  :init
  ;; Disable native compilation because the package has some issues.
  (add-to-list
   'native-comp-jit-compilation-deny-list
   "realgud-node-inspect.*"))

(provide 'my-programming)
