(global-auto-revert-mode)

;; TODO: Only for text-mode and prog-mode derived modes.
(column-number-mode)

(use-package recentf
  :config (recentf-mode))

(use-package savehist
  :config (savehist-mode))

(use-package repeat
  :config (repeat-mode))

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

;; TODO: Improve integration
;; TODO: Don't hard code paths
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

;; TODO: Install magit (or whatever made rebasing so nice in Prelude)

(provide 'my-convenience)
