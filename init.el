;;-------------------------------------------------------------------------
;; Behaviour
;;-------------------------------------------------------------------------

(setq at-work nil)
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
(if (and window-system (string= system-type "gnu/linux"))
    (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "xdg-open"))
(server-start)


;;-------------------------------------------------------------------------
;; Hooks
;;-------------------------------------------------------------------------

;; text-mode
(defun my-text-mode-hook ()
  (visual-line-mode t))
(add-hook 'text-mode-hook 'my-text-mode-hook)

;; c-mode
(defun my-c-mode-common-hook ()
  (setq tab-width (if at-work 3 4))
  (setq indent-tabs-mode nil)
  (setq c-style (if at-work "bsd" "k&r"))
  (setq c-basic-offset tab-width)
  (flyspell-prog-mode))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-c++-mode-hook ()
  (if (not at-work) (setq c-style "stroustrup")))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(c-add-style "ufsi-java"
             '((c-basic-offset . 3)
               (c-comment-only-line-offset . (0 . 0))
               (c-auto-align-backslashes . nil)
               (c-offsets-alist . (;; ufsi-java-style
                                   (inline-open . 0)
                                   (topmost-intro-cont . +)
                                   (statement-block-intro . +)
                                   (knr-argdecl-intro . 5)
                                   (substatement-open . +)
                                   (substatement-label . +)
                                   (label . +)
                                   (statement-case-open . +)
                                   (statement-cont . +)
                                   (access-label . 0)
                                   (arglist-close . 0)
                                   ;; java-style
                                   (arglist-intro . +)
                                   (arglist-cont-nonempty . +)
                                   (member-init-intro . +)
                                   (defun-block-intro . +)
                                   (func-decl-cont . +)
                                   (statement . 0)
                                   (statement-cont . +)
                                   (statement-case-intro . +)
                                   (substatement . +)
                                   (inclass . +)
                                   (innamespace . +)
                                   (access-label . -)
                                   (c . 1)
                                   (cpp-define-intro . +)
                                   (cpp-macro . -)
                                   (stream-op . +)
                                   (inexpr-class . 0)
                                   (brace-list-intro . +)
                                   (brace-list-entry
                                    . (lambda (langelem)
                                        (save-excursion
                                          (beginning-of-line)
                                          (backward-up-list 2)
                                          (forward-to-indentation)
                                          (vector (+ (current-column)
                                                     c-basic-offset))))))))
             nil)

(defun my-java-mode-hook ()
  (setq c-style (if at-work "ufsi-java" "java"))
  (require 'java-mode-indent-annotations)
  (java-mode-indent-annotations-setup))
(add-hook 'java-mode-hook 'my-java-mode-hook)

;; lisp-mode
(defun my-lisp-mode-hook ()
  (setq indent-tabs-mode nil)
  (flyspell-prog-mode)
  (highlight-parentheses-mode))
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)

;; nxml-mode
(defun my-nxml-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (setq nxml-child-indent tab-width)
  (setq nxml-outline-child-indent tab-width)
  (flyspell-mode t))
(add-hook 'nxml-mode-hook 'my-nxml-mode-hook)

;; espresso-mode
(defun my-espresso-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil))
(add-hook 'espresso-mode-hook 'my-espresso-mode-hook)

;; latex-mode
(defun my-latex-mode-hook ()
  (add-to-list 'TeX-output-view-style '("^.*$" "." "xdg-open %o"))
  (if (fboundp 'Tex-PDF-Mode)
      (TeX-PDF-mode t)
    (if (fboundp 'tex-pdf-mode)
        (tex-pdf-mode t)))
  (auto-fill-mode t)
  (flyspell-mode t))
(add-hook 'LaTeX-mode-hook 'my-latex-mode-hook)

;; flyspell-mode
(if (string= system-type "windows-nt")
    (defadvice flyspell-mode (around flyspell-mode-around)))
(defun my-flyspell-mode-hook ()
  (flyspell-buffer))
(add-hook 'flyspell-mode-hook 'my-flyspell-mode-hook)


;;-------------------------------------------------------------------------
;; Commands
;;-------------------------------------------------------------------------

(if (string= system-type "gnu/linux")
    (progn
      (defun mutt ()
        (interactive)
        (add-to-list 'auto-mode-alist '("/mutt" . message-mode))
        (add-hook 'message-mode-hook (lambda () (auto-fill-mode t)))
        (ansi-term "mutt"))

      (defun irssi ()
        (interactive)
        (ansi-term "irssi"))))

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


;;-------------------------------------------------------------------------
;; Packages
;;-------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d")

;; color-theme
(if window-system
    (progn
      (if (require 'color-theme "color-theme" t)
          (progn
            (if (fboundp 'color-theme-initialize)
                (color-theme-initialize))
            (color-theme-charcoal-black)))))

;; org-mode
(setq org-directory (if at-work "Z:/org/" "~/org/"))
(setq org-hide-leading-stars t)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(add-hook 'org-mode-hook (lambda () (progn
                                      (auto-fill-mode t)
                                      (flyspell-mode t))))

;; remember-mode
(if (not (fboundp 'remember-mode))
    (progn (add-to-list 'load-path "~/.emacs.d/remember")
           (require 'remember)
           (setq remember-annotation-functions '(org-remember-annotation))
           (setq remember-handler-functions '(org-remember-handler))
           (add-hook 'remember-mode-hook 'org-remember-apply-template)
           (add-to-list 'auto-mode-alist '("\\.org$" . org-mode)))
  (org-remember-insinuate))
(global-set-key "\C-cr" 'org-remember)

;; maxima
(if at-work
    (progn
      (setq exec-path (append exec-path '("d:/Programme/Maxima-5.20.0/bin")))
      (add-to-list 'load-path
                   "d:/Programme/Maxima-5.20.0/share/maxima/5.20.0/emacs/")
      (autoload 'maxima-mode "maxima" "Maxima mode" t)
      (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
      (autoload 'maxima "maxima" "Maxima interaction" t)
      (autoload 'imath-mode "imath" "Imath mode for math formula input" t))
  (progn
    (setq imaxima-pt-size 12)
    (setq imaxima-fnt-size "large")))
(setq imaxima-use-maxima-mode-flag t)

;; nxhtml
(if (fboundp 'nxhtml-load-nxhtml-from-emacsw32)
    (nxhtml-load-nxhtml-from-emacsw32)
  (load "~/.emacs.d/nxhtml/autostart"))
(setq mumamo-chunk-coloring 1)

;; espresso-mode
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(defalias 'js-mode 'espresso-mode)

;; css-mode
(defun my-css-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil))
(add-hook 'css-mode-hook 'my-css-mode-hook)

;; csharp-mode
(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

;; groovy-mode
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; dos-mode
(autoload 'dos-mode "dos" "Edit Dos scripts." t)
(add-to-list 'auto-mode-alist '("\\.bat$" . dos-mode))

;; textile-mode
(autoload 'textile-mode "textile-mode" "" t)
(add-hook 'textile-mode-hook 'visual-line-mode)

;; gwt-mumamo-mode
(add-to-list 'load-path "~/.emacs.d/gwt-mumamo")
(autoload 'gwt-mumamo-mode "gwt-mumamo" "" t)
(add-to-list 'auto-mode-alist '("\.java$" . gwt-mumamo-mode))

;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\.md$" . markdown-mode))

;; highlight-parentheses-mode
(require 'highlight-parentheses)

;; clojure-mode
(autoload 'clojure-mode "clojure-mode" "" t)
(add-to-list 'auto-mode-alist '("\.clj$" . clojure-mode))
(add-hook 'clojure-mode-hook 'my-lisp-mode-hook)

;; speedbar
(eval-after-load "speedbar" '(load-library "sb-html"))
(eval-after-load "speedbar" '(load-library "sb-texinfo"))

;;-------------------------------------------------------------------------
;; Customize
;;-------------------------------------------------------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org/ou/tasks.org" "~/org/tasks.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
