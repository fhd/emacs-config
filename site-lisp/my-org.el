(setq org-duration-format 'h:mm)
(setq org-export-allow-bind-keywords t)
(setq org-clock-display-default-range 'untilnow)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)
   (lisp . t)))

(provide 'my-org)
