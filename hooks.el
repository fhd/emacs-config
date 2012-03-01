(add-hook 'text-mode-hook
          (lambda () (visual-line-mode t)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (setq c-style "k&r")
            (setq c-basic-offset tab-width)
            (flyspell-prog-mode)
            (highlight-80+-mode)
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
  (setq indent-tabs-mode nil)
  (highlight-parentheses-mode)
  (paredit-mode)
  (flyspell-prog-mode)
  (highlight-80+-mode))
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)

(add-hook 'clojure-mode-hook 'my-lisp-mode-hook)
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq safe-local-variable-values
                  '((inferior-lisp-program . "lein repl")
                    (inferior-lisp-program . "smvn clojure:repl")
                    (compile-command . "lein cljs compile-dev")))))

(add-hook 'scheme-mode-hook 'my-lisp-mode-hook)
(add-hook 'scheme-mode-hook
          (lambda ()
            (setq safe-local-variable-values
                  '((scheme-program-name . "schemejs")))))

(add-hook 'nxml-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (setq nxml-child-indent tab-width)
            (setq nxml-outline-child-indent tab-width)
            (flyspell-prog-mode)
            (highlight-80+-mode)))

(add-hook 'html-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode nil)
            (flyspell-prog-mode)
            (highlight-80+-mode)))

(add-hook 'css-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (flyspell-prog-mode)
            (highlight-80+-mode)))

(add-hook 'js-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (flyspell-prog-mode)
            (highlight-80+-mode)
            (subword-mode)))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (add-to-list 'TeX-output-view-style '("^.*$" "." "xdg-open %o"))
            (if (fboundp 'Tex-PDF-Mode)
                (TeX-PDF-mode t)
              (if (fboundp 'tex-pdf-mode)
                  (tex-pdf-mode t)))
            (auto-fill-mode t)
            (flyspell-mode t)
            (highlight-80+-mode)))

(add-hook 'python-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (highlight-80+-mode)))

(add-hook 'flyspell-mode-hook
          (lambda ()
            (auto-dictionary-mode)))

(add-hook 'org-mode-hook (lambda ()
                           (auto-fill-mode t)
                           (flyspell-mode t)))

(add-hook 'groovy-mode-hook
          (lambda ()
            (subword-mode)
            (flyspell-prog-mode)
            (highlight-80+-mode)))

(add-hook 'php-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (highlight-80+-mode)))

(provide 'hooks)
