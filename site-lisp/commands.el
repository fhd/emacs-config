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

(defun restart-emacs ()
  "Restart Emacs."
  (interactive)
  (add-hook 'kill-emacs-hook
            (lambda ()
              (server-force-delete)
              (call-process (locate-file invocation-name
                                         (list invocation-directory))
                            nil 0)))
  ;; Not using save-buffers-kill-emacs because that could be aborted,
  ;; and the kill-emacs-hook would still be there.
  (save-some-buffers)
  (kill-emacs))

(defun update-emacs-config ()
  "Update Emacs configuration."
  (interactive)
  (cd emacs-d)
  (if (not (= (shell-command "git pull | grep \"Already up-to-date.\"") 0))
      (progn
        (if (y-or-n-p "Configuration updated. Do you want to restart Emacs? ")
            (restart-emacs)))
    (message "Configuration already up-to-date.")))

;; TODO: Handle media queries
;; TODO: Handle wrapped lines
;; TODO: Ignore vendor prefixes
(defun sort-css-properties ()
  "Sort CSS properties alphabetically."
  (interactive)
  (let ((start (search-forward "{"))
        (end (search-forward "}")))
    (when (and start end)
      (sort-lines nil start end)
      (sort-declarations))))

(provide 'commands)
