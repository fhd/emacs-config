(defvar c-header-guess-extension-mode-alist
  '((c++-mode ("cpp" "cxx" "cc"))
    (objc-mode ("m" "mm"))))

(defun c-header-guess-files-exist (basename extensions)
  (loop for extension in extensions
        if (file-exists-p (concat basename "." extension))
        return t))

(defun c-header-guess-mode-for-basename (basename)
  (or (loop for mode-extensions in c-header-guess-extension-mode-alist
            if (c-header-guess-files-exist basename (cadr mode-extensions))
            return (car mode-extensions))
      'c-mode))

;;;###autoload
(defun c-header-guess-mode ()
  (interactive)
  (funcall (c-header-guess-mode-for-basename
            (replace-regexp-in-string "\\.h$" "" (buffer-file-name)))))

(provide 'c-header-guess-mode)
