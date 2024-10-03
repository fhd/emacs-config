(setq org-duration-format 'h:mm)
(setq org-export-allow-bind-keywords t)
(setq org-clock-display-default-range 'untilnow)

;; Support plantuml in org-mode
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
(setq org-plantuml-jar-path (expand-file-name plantuml-jar-path))

(provide 'my-org)
