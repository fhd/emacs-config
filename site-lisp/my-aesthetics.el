(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))

(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

(let ((font "Hack 10"))
  (if (find-font (font-spec :name font))
      (add-to-list 'default-frame-alist (cons 'font font))))

(provide 'my-aesthetics)
