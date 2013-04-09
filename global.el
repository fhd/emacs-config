(setq inhibit-splash-screen t)
(column-number-mode t)
(show-paren-mode t)
(transient-mark-mode t)
(global-auto-revert-mode t)
(setq frame-title-format '("%b - " invocation-name "@" system-name))
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
(delete-selection-mode t)
(setq-default truncate-lines t)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq ido-enable-flex-matching t)
(setq ido-auto-merge-work-directories-length -1)
(ido-mode t)

(if (>= emacs-major-version 24)
    (load-theme 'wombat t))
(setq custom-enabled-themes '(wombat))
(if (and (= emacs-major-version 24) (< emacs-minor-version 3))
    (setq ansi-term-color-vector [unspecified
                                  "grey30" "red2" "spring green" "yellow2"
                                  "steel blue" "magenta2" "cyan2" "white"])
  (custom-set-faces
   `(term-color-black ((t (:foreground "grey30" :background "grey30"))))
   `(term-color-red ((t (:foreground "red2" :background "red2"))))
   `(term-color-green ((t (:foreground "spring green" :background "spring green"))))
   `(term-color-yellow ((t (:foreground "yellow2" :background "yellow2"))))
   `(term-color-blue ((t (:foreground "steel blue" :background "steel blue"))))
   `(term-color-magenta ((t (:foreground "magenta2" :background "magenta2"))))
   `(term-color-cyan ((t (:foreground "cyan2" :background "cyan2"))))
   `(term-color-white ((t (:foreground "white" :background "white"))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))))

(when window-system
  (tool-bar-mode -1)
  (menu-bar-mode t)
  (if (string= system-type "gnu/linux")
    (setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "xdg-open"
	  x-select-enable-clipboard t)))

(if (string= system-type "darwin")
    (setenv "PATH" (shell-command-to-string
                    "source $HOME/.profile 2>/dev/null && echo $PATH")))

(defvar my-term-shell "bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(provide 'global)
