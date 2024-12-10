(use-package org
  :ensure nil
  :config
  (setq org-duration-format 'h:mm)
  (setq org-export-allow-bind-keywords t)
  (setq org-clock-display-default-range 'untilnow)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (shell . t)
     (lisp . t))))

(use-package verb
  :ensure t
  :after org
  :config
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map)
  (setq verb-auto-kill-response-buffers t))

(provide 'my-org)
