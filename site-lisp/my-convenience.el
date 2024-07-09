(global-auto-revert-mode)

(column-number-mode)

(use-package recentf
  :config (recentf-mode))

(use-package savehist
  :config (savehist-mode))

(use-package repeat
  :config (repeat-mode))

(use-package isearch
  :config
  (setq isearch-lazy-count t))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("M-g o" . consult-outline)))

(use-package vertico
  :ensure t
  :config (vertico-mode))

(use-package marginalia
  :ensure t
  :config (marginalia-mode))

(use-package orderless
  :ensure t
  :config (setq completion-styles '(orderless basic)))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; TODO: Improve integration.
;; TODO: Don't hard code paths.
(use-package languagetool
  :ensure t
  :defer t
  :commands (languagetool-check
             languagetool-clear-suggestions
             languagetool-correct-at-point
             languagetool-correct-buffer
             languagetool-set-language
             languagetool-server-mode
             languagetool-server-start
             languagetool-server-stop)
  :config
  (setq languagetool-java-arguments '("-Dfile.encoding=UTF-8"))
  (setq languagetool-console-command
        "~/Software/LanguageTool/languagetool-commandline.jar")
  (setq languagetool-server-command
        "~/Software/LanguageTool/languagetool-server.jar"))

(use-package embark
  :ensure t)

(use-package embark-consult
  :ensure t)

(setq enable-recursive-minibuffers t)

(use-package wgrep
  :ensure t)

;; TODO: Improve the colours.
(use-package diredfl
  :ensure t
  :hook ((dired-mode . diredfl-mode)))

;; TODO: Try out https://github.com/magit/forge
(use-package magit
  :ensure t)

(use-package rg
  :ensure t)

;; TODO: Consider adding shortcuts for Magit and opening the README.
(use-package project
  :ensure nil
  :bind
  (("C-x p t" . my-project-vterm)
   ("C-x p g" . my-project-grep)
   ("C-x p m" . my-project-magit))
  :config
  (defun my-project-vterm ()
    (interactive)
    (let* ((default-directory (project-root (project-current t)))
           (default-project-term-name (project-prefixed-buffer-name "vterm"))
           (term-buffer (get-buffer default-project-term-name)))
      (if (and term-buffer (not current-prefix-arg))
          (pop-to-buffer term-buffer (bound-and-true-p display-comint-buffer-action))
        (vterm (generate-new-buffer-name default-project-term-name)))))

  (defun my-project-grep (regexp)
    (interactive
     (list
      (read-regexp "Grep project: ")))
    (let* ((default-directory (project-root (project-current t))))
      (rg regexp "*" default-directory)))

  (defun my-project-magit ()
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (magit-status default-directory)))

  (setopt project-switch-commands
          '((project-dired "Root dired")
            (project-find-file "Find file")
            (my-project-grep "Grep")
            (project-find-dir "Find directory")
            (my-project-magit "Magit")
            (project-vc-dir "VC-Dir")
            (my-project-vterm "vterm"))))

(provide 'my-convenience)
