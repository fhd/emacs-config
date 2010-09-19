;;; gwt-mumamo.el --- Multi major modes for Google Web Toolkit code

;; Copyright (C) 2010 Felix H. Dahlke

;; Author: Felix H. Dahlke <fhd@ubercode.de>
;; Version: 1.2.0
;; Keywords: languages, gwt

;; This file is not part of GNU Emacs.

;;; Commentary:

;; The Google Web Toolkit (GWT) allows you to write client-side code for
;; web applications in Java, which is translated to JavaScript by the GWT
;; compiler. It is possible to write inline JavaScript via the JavaScript
;; Native Interface (JSNI), and this mode uses MuMaMo from nXhtml to
;; provide support for both Java and inline JavaScript in the same file.

;;; Installation:

;; In order to use gwt-mumamo, you will need nXhtml, get it here:
;;   http://ourcomments.org/Emacs/nXhtml/doc/nxhtml.html

;; If your Emacs version is 23.1 or below, you will need espresso-mode:
;;   http://www.nongnu.org/espresso/
;; You also need to add an alias to it, add the following to your init
;; file:
;;   (defalias 'js-mode 'espresso-mode)

;; Add this file to your load-path and add the following line to your
;; init file:
;;   (autoload 'gwt-mumamo-mode "gwt-mumamo" "" t)
;; You can now activate gwt-mumamo by invoking "gwt-mumamo-mode"

;; gwt-mumamo works just like java-mode when used for normal Java
;; files, so you can use it as the standard mode for all .java files
;; if you like:
;;   (add-to-list 'auto-mode-alist '("\.java$" . gwt-mumamo-mode))

;; The only notable difference between java-mode and gwt-mumamo-mode
;; is the background colour, because mumamo changes it. If you want
;; the same background colour as in other modes, add:
;;   (setq mumamo-chunk-coloring 1)
;; This will make mumamo colour only inline code.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Code:

(require 'mumamo)

(defconst mumamo-gwt-jsni-start-regex (rx "/*-" space "{"))

(defconst mumamo-gwt-jsni-end-regex (rx "}" space "-*/"))

(defun mumamo-search-bw-exc-start-gwt-jsni (pos min)
  ;; TODO: Check if the block follows a native method declaration
  ;; (goto-char (+ pos 3))
  ;; (let ((marker-start (search-backward "/*-" min t))
  ;;       exc-start)
  ;;   (when marker-start
  ;;     (when (looking-at mumamo-gwt-jsni-start-regex)
  ;;       (setq exc-start (match-end 0))
  ;;       (goto-char exc-start)
  ;;       (when (<= exc-start pos)
  ;;         (list (point) 'js-mode))))))
  (let ((exc-start (mumamo-chunk-start-bw-str pos min "/*-{")))
    (and exc-start
         (<= exc-start pos)
         (cons exc-start 'espresso-mode)))) ;; TODO: Use "js-mode"
                                            ;; (alias causes hangup)

(defun mumamo-search-bw-exc-end-gwt-jsni (pos min)
  (mumamo-chunk-end-bw-str pos min "}-*/")) ;; TODO: Use regex

(defun mumamo-search-fw-exc-start-gwt-jsni (pos max)
  (mumamo-chunk-start-fw-str pos max "/*-{")) ;; TODO: Use regex

(defun mumamo-search-fw-exc-end-gwt-jsni (pos max)
  (save-match-data
    (mumamo-chunk-end-fw-str pos max "}-*/"))) ;; TODO: Use regex

(defun mumamo-chunk-gwt-jsni (pos min max)
  "Find /*-{ ... }-*/, return range and js-mode."
  (mumamo-find-possible-chunk pos min max
                              'mumamo-search-bw-exc-start-gwt-jsni
                              'mumamo-search-bw-exc-end-gwt-jsni
                              'mumamo-search-fw-exc-start-gwt-jsni
                              'mumamo-search-fw-exc-end-gwt-jsni))

(define-mumamo-multi-major-mode gwt-mumamo-mode
  "Turn on multiple major modes for Google Web Toolkit code.
The main mode is `java-mode', `js-mode' is used for JSNI blocks."
  ("GWT Family" java-mode (mumamo-chunk-gwt-jsni)))

;;; gwt-mumamo.el ends here
