;;;###autoload
(defun c-header-guess-mode ()
  (interactive)
  (let* ((basename (replace-regexp-in-string "\\.h$" "" (buffer-file-name)))
         (cpp-exists (or (file-exists-p (concat basename ".cpp"))
                         (file-exists-p (concat basename ".cc"))))
         (m-exists (or (file-exists-p (concat basename ".m"))
                       (file-exists-p (concat basename ".mm")))))
    (cond
     (cpp-exists (c++-mode))
     (m-exists (objc-mode))
     ((c-mode)))))

(provide 'c-header-guess-mode)
