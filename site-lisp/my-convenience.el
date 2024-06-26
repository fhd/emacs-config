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

;; TODO: Add some custom project.el commands, such as opening a vterm, opening
;;       the README and such. Just having a command to open the project
;;       directory in dired would be useful after switching projects, but
;;       there's useless stuff like "VC-Dir" instead. Maybe I can change find
;;       regex to use ripgrep if available?

;; TODO: See if I can't automatically indent text below the TODO keyword in
;;       comments.

(provide 'my-convenience)
