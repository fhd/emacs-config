;;; svelte-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "svelte-mode" "svelte-mode.el" (0 0 0 0))
;;; Generated autoloads from svelte-mode.el

(autoload 'svelte-mode "svelte-mode" "\
Major mode based on `html-mode', but works with embedded JS and CSS.

Code inside a <script> element is indented using the rules from
`js-mode'; and code inside a <style> element is indented using
the rules from `css-mode'.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.svelte\\'" . svelte-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "svelte-mode" '("svelte-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; svelte-mode-autoloads.el ends here
