;; Disabled because it's more annoying than helpful - especially in web-mode
;; when using tabs.
(electric-indent-mode -1)

(setq compilation-scroll-output 'first-error)

;; If this isn't enough, fancy-compilation seems worth a try.
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(which-function-mode)

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

;; Load Slime from Roswell if available.
;; TODO: Figure out how to load this lazily.
(if-let ((roswell-helper "~/.roswell/helper.el")
         (_ (file-exists-p roswell-helper)))
    (load (expand-file-name roswell-helper))
  (use-package slime
    :ensure t
    :defer t))

(use-package poetry
  :ensure t
  :defer t
  :hook ((python-mode . poetry-tracking-mode)
         (python-ts-mode . poetry-tracking-mode))
  :config
  ;; poetry-tracking-mode creates a *poetry* buffer which bothers me
  ;; occasionally, this should bury it.
  (defun my-bury-poetry-buffer (&rest _)
    (when-let ((buffer (get-buffer (poetry-buffer-name))))
      (bury-buffer buffer)))
  (advice-add 'poetry-do-call :after 'my-bury-poetry-buffer))

(use-package pyvenv
  :ensure t)

(use-package pyvenv-auto
  :ensure t
  :after pyvenv
  :hook ((python-mode . pyvenv-auto-run)
         (python-ts-mode . pyvenv-auto-run)))

(use-package nodejs-repl
  :ensure t
  :defer t
  :hook ((js-mode . nodejs-repl-minor-mode)
         (js-ts-mode . nodejs-repl-minor-mode)))

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

(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode)
  ;; TODO: Find a less hacky way.
  ;; Syntax highlighting in csharp-ts-mode seems broken.
  (setq treesit-auto-langs (delete 'c-sharp treesit-auto-langs))
  (setq auto-mode-alist
        (delete '("\\.cs\\'" . csharp-ts-mode) auto-mode-alist)))

(provide 'my-programming)
