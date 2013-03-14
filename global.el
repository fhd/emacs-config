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
(setq ansi-term-color-vector [unspecified
                              "grey30" "red2" "spring green" "yellow2"
                              "steel blue" "magenta2" "cyan2" "white"])

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
