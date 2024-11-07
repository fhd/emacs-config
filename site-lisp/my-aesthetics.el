(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))

(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

;; TODO: On one machine, this doesn't work when I launch Emacs with "Emacs
;; (Client)". It does work when I launch it with "Emacs (Gui)". Find a
;; workaround.
(let ((font "Hack 10"))
  (when (find-font (font-spec :name font))
    (set-frame-font font)
    (add-to-list 'default-frame-alist (cons 'font font))))

(provide 'my-aesthetics)
