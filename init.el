;; Behaviour

(setq inhibit-splash-screen t)
(column-number-mode t)
(show-paren-mode t)
(transient-mark-mode t)
(setq frame-title-format '("%b - " invocation-name "@" system-name))
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
(delete-selection-mode t)
(setq ispell-dictionary "british")
(setq-default truncate-lines t)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (and window-system (string= system-type "gnu/linux"))
    (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "xdg-open"))
(server-start)

;; Hooks

(add-hook 'text-mode-hook
          (lambda () (visual-line-mode t)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (setq c-style "k&r")
            (setq c-basic-offset tab-width)
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
  (highlight-80+-mode))
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'clojure-mode-hook 'my-lisp-mode-hook)

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
            (highlight-80+-mode)))

(add-hook 'js-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
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
          (lambda () highlight-80+-mode))

;; org-mode

(setq org-directory "~/org/")
(setq org-hide-leading-stars t)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(add-hook 'org-mode-hook (lambda () (progn
                                      (auto-fill-mode t)
                                      (flyspell-mode t))))


;; Commands

(defun mutt ()
  (interactive)
  (add-to-list 'auto-mode-alist '("/mutt" . message-mode))
  (add-hook 'message-mode-hook (lambda () (auto-fill-mode t)))
  (ansi-term "mutt"))

(defun irssi ()
  (interactive)
  (ansi-term "irssi"))

(defun ant (target)
  (interactive "MTarget: ")
  (compile (concat "ant -find build.xml -emacs " target)))

(defun sync-org-files ()
  (interactive)
  (if (file-exists-p org-directory)
      (progn
        (cd org-directory)
        (shell-command "git pull")
        (shell-command "git commit -a -m \"Updated org files.\"")
        (shell-command "git push"))))

(defun count-words (&optional begin end)
  "Returns the number of words between start and end.
If no region is defined, all words in the buffer are counted."
  (interactive "r")
  (let ((b (if mark-active begin (point-min)))
        (e (if mark-active end (point-max))))
    (message "Word count: %s" (how-many "\\w+" b e))))


;; Packages

;; package.el
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; color-theme
(require 'color-theme)
(color-theme-charcoal-black)

;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\.md$" . markdown-mode))

;; jade-mode
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\.jade$" . jade-mode))

;; groovy-mode
(require 'groovy-mode)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; actionscript-mode
(require 'actionscript-mode)
(add-to-list 'auto-mode-alist '("\.as$" . actionscript-mode))

;; clojure-mode for clojurescript
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; malabar-mode
;;(setq malabar-dir "~/.emacs.d/site-lisp/malabar-1.4.0")
;;(add-to-list 'load-path (concat malabar-dir "/lisp"))
;;(require 'malabar-mode)
;;(setq malabar-groovy-lib-dir (concat malabar-dir "/lib"))
;;(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; nxhtml
(load "~/.emacs.d/site-lisp/nxhtml/autostart")

;; puppet-mode
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
