(defvar c-header-guess-c++-extensions '("cpp" "cc" "cxx"))
(defvar c-header-guess-objc-extensions '("m" "mm"))

(defun c-header-guess-files-exist (basename extensions)
  (loop for extension in extensions
        if (file-exists-p (concat basename "." extension))
        return t))

(defun c-header-guess-mode-for-basename (basename)
  (cond
   ((c-header-guess-files-exist basename c-header-guess-c++-extensions)
    'c++-mode)
   ((c-header-guess-files-exist basename c-header-guess-objc-extensions)
    'obcj-mode)
   ('c-mode)))

;;;###autoload
(defun c-header-guess-mode ()
  (interactive)
  (funcall (c-header-guess-mode-for-basename
            (replace-regexp-in-string "\\.h$" "" (buffer-file-name)))))

(provide 'c-header-guess-mode)
