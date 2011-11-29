;;; auto-dictionary-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (adict-change-dictionary adict-guess-dictionary
;;;;;;  auto-dictionary-mode) "auto-dictionary" "auto-dictionary.el"
;;;;;;  (20180 27169))
;;; Generated autoloads from auto-dictionary.el

(autoload 'auto-dictionary-mode "auto-dictionary" "\
A minor mode that automatically sets `ispell-dictionary`.

\(fn &optional ARG)" t nil)

(autoload 'adict-guess-dictionary "auto-dictionary" "\
Automatically change ispell dictionary based on buffer language.
Calls `ispell-change-dictionary' and runs `adict-change-dictionary-hook'.  If
BUFFER is nil, the current buffer is used.  If IDLE-ONLY is set, abort
when an input event occurs.

\(fn &optional IDLE-ONLY)" t nil)

(autoload 'adict-change-dictionary "auto-dictionary" "\
Set buffer language to LANG and stop detecting it automatically.

\(fn &optional LANG)" t nil)

;;;***

;;;### (autoloads nil nil ("auto-dictionary-pkg.el") (20180 27169
;;;;;;  852793))

;;;***

(provide 'auto-dictionary-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auto-dictionary-autoloads.el ends here
