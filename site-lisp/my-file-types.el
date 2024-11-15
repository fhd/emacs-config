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
  :mode ("\\.html$" "\\.razor$")
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

(use-package plantuml-mode
  :ensure t
  :defer t
  :mode ("\\.plantuml$")
  :config
  (setq plantuml-jar-path "~/Software/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
  (setq org-plantuml-jar-path (expand-file-name plantuml-jar-path)))

(use-package powershell
  :ensure t
  :defer t)

(use-package dart-mode
  :ensure t
  :defer t)

(use-package conf-mode
  :ensure nil
  :mode ("\\.sln$"))

(provide 'my-file-types)
