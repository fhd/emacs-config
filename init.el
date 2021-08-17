(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(backup-directory-alist (quote (("" . "~/.emacs.d/backup"))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(editorconfig-mode t)
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin")))
 '(fill-column 80)
 '(indent-tabs-mode nil)
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (web-mode clojure-mode svelte-mode po-mode prettier js2-mode kotlin-mode groovy-mode gradle-mode php-mode editorconfig yaml-mode multi-term csv-mode typescript-mode markdown-mode todotxt-mode todotxt)))
 '(show-paren-mode t)
 '(transient-mark-mode t)
 '(truncate-lines nil)
 '(truncate-partial-width-windows 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-black ((t (:foreground "grey30" :background "grey30"))))
 '(term-color-blue ((t (:foreground "steel blue" :background "steel blue"))))
 '(term-color-cyan ((t (:foreground "cyan2" :background "cyan2"))))
 '(term-color-green ((t (:foreground "spring green" :background "spring green"))))
 '(term-color-magenta ((t (:foreground "magenta2" :background "magenta2"))))
 '(term-color-red ((t (:foreground "red2" :background "red2"))))
 '(term-color-white ((t (:foreground "white" :background "white"))))
 '(term-color-yellow ((t (:foreground "yellow2" :background "yellow2"))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-white)))))
