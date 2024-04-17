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
  :mode ("\\.html$" "\\.php$"))

(provide 'my-file-types)
