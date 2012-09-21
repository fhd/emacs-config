(defun prog-common-hook ()
  (flyspell-prog-mode)
  (highlight-80+-mode)
  (setq show-trailing-whitespace t))

(add-hook 'text-mode-hook
          (lambda () (visual-line-mode t)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (prog-common-hook)
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (setq c-style "k&r")
            (setq c-basic-offset tab-width)
            (subword-mode)
            (local-set-key [(control return)] 'semantic-complete-symbol)))

(add-hook 'c++-mode-hook
          (lambda () (setq c-style "stroustrup")))

(add-hook 'java-mode-hook
          (lambda ()
            (setq c-style "java")
            (require 'java-mode-indent-annotations)
            (java-mode-indent-annotations-setup)
            (subword-mode)))

(defun my-lisp-mode-hook ()
  (prog-common-hook)
  (setq indent-tabs-mode nil)
  (highlight-parentheses-mode)
  (paredit-mode))
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)

(add-hook 'clojure-mode-hook 'my-lisp-mode-hook)
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq safe-local-variable-values
                  '((inferior-lisp-program . "lein repl")
                    (inferior-lisp-program . "smvn clojure:repl")))))

(add-hook 'scheme-mode-hook 'my-lisp-mode-hook)
(add-hook 'scheme-mode-hook
          (lambda ()
            (setq safe-local-variable-values
                  '((scheme-program-name . "schemejs")))))

(add-hook 'nxml-mode-hook
          (lambda ()
            (prog-common-hook)
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (setq nxml-child-indent tab-width)
            (setq nxml-outline-child-indent tab-width)))

(add-hook 'html-mode-hook
          (lambda ()
            (prog-common-hook)
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode nil)))

(add-hook 'css-mode-hook
          (lambda ()
            (prog-common-hook)
            (setq tab-width 4)
            (setq indent-tabs-mode nil)))

(add-hook 'js-mode-hook
          (lambda ()
            (prog-common-hook)
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (subword-mode)
            (setq inferior-js-program-command "node")
            (ansi-color-for-comint-mode-on)
            (add-to-list 'comint-preoutput-filter-functions
                         (lambda (output)
                           (replace-regexp-in-string
                            ".*1G\.\.\..*5G" "... "
                            (replace-regexp-in-string
                             ".*1G.*3G" "> " output))))
            (setq safe-local-variable-values
                  '((js-indent-level . 2)))))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (prog-common-hook)
            (add-to-list 'TeX-output-view-style '("^.*$" "." "xdg-open %o"))
            (if (fboundp 'Tex-PDF-Mode)
                (TeX-PDF-mode t)
              (if (fboundp 'tex-pdf-mode)
                  (tex-pdf-mode t)))
            (auto-fill-mode t)))

(add-hook 'python-mode-hook
          (lambda ()
            (prog-common-hook)
            (setq safe-local-variable-values
                  '((python-indent . 2)))))

(add-hook 'flyspell-mode-hook
          (lambda ()
            (auto-dictionary-mode)))

(add-hook 'org-mode-hook (lambda ()
                           (auto-fill-mode t)
                           (flyspell-mode t)))

(add-hook 'groovy-mode-hook
          (lambda ()
            (prog-common-hook)
            (subword-mode)))

(add-hook 'php-mode-hook
          (lambda ()
            (prog-common-hook)
            (subword-mode)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (prog-common-hook)
            (rvm-activate-corresponding-ruby)
            (inf-ruby-keys)
            (setq ruby-deep-indent-paren nil)))

(provide 'hooks)
