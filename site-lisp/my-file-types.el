(setq c-default-style
      '((c++-mode . "stroustrup")
        (csharp-mode . "csharp")
        (java-mode . "java")
        (awk-mode . "awk")
        (other . "k&r")))

(use-package js
  :custom
  (js-switch-indent-offset 2))

(use-package markdown-mode
  :ensure t
  :defer t)

(use-package csv-mode
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :defer t)

(use-package web-mode
  :ensure t
  :defer t
  :mode ("\\.html$")
  :config
  (setq web-mode-enable-auto-indentation nil))

(use-package php-mode
  :ensure t)

(use-package gdscript-mode
  :ensure t
  :defer t)

(use-package rust-mode
  :ensure t
  :defer t)

(use-package typescript-mode
  :ensure t
  :defer t)

(use-package kotlin-mode
  :ensure t
  :defer t)

(use-package clojure-mode
  :ensure t
  :defer t)

(use-package lua-mode
  :ensure t
  :defer t)

(use-package dockerfile-mode
  :ensure t
  :defer t)

(use-package cmake-mode
  :ensure t
  :defer t)

(use-package ledger-mode
  :ensure t
  :defer t)

(provide 'my-file-types)
