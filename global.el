(setq inhibit-splash-screen t)
(column-number-mode t)
(show-paren-mode t)
(transient-mark-mode t)
(setq frame-title-format '("%b - " invocation-name "@" system-name))
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
(delete-selection-mode t)
(setq-default truncate-lines t)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(if (and window-system (string= system-type "gnu/linux"))
    (progn (setq browse-url-browser-function 'browse-url-generic
		 browse-url-generic-program "xdg-open")
	   (setq x-select-enable-clipboard t)))

(if (string= system-type "darwin")
    (setenv "PATH" (shell-command-to-string
                    "source $HOME/.profile 2>/dev/null && echo $PATH")))

(provide 'global)
