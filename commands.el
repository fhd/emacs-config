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

(provide 'commands)
