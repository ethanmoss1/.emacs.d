;;; yang.el --- Emacs major mode for editing YANG file  -*- lexical-binding: t; -*-

;; Copyright (C) 2026  ethan

;; Author: ethan <ethan@thinkpad>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;; Useful tips:

;;   Common YANG layout:
;;     (defun my-yang-mode-hook ()
;;       "Configuration for YANG Mode.  Add this to `yang-mode-hook'."
;;       (if window-system
;;         (progn
;;           (c-set-style "BSD")
;;           (setq indent-tabs-mode nil)
;;           (setq c-basic-offset 2)
;;           (setq font-lock-maximum-decoration t)
;;           (font-lock-mode t))))
;;
;;     (add-hook 'yang-mode-hook 'my-yang-mode-hook)

;;   Using the outline minor mode for YANG is very useful to get a
;;   good overview of the structure of a module.
;;
;;   Put this in your .emacs:
;;
;;     (defun show-onelevel ()
;;       "show entry and children in outline mode"
;;       (interactive)
;;       (show-entry)
;;       (show-children))
;;
;;     (defun my-outline-bindings ()
;;       "sets shortcut bindings for outline minor mode"
;;       (interactive)
;;       (local-set-key [?\C-,] 'hide-body)
;;       (local-set-key [?\C-.] 'show-all)
;;       (local-set-key [C-up] 'outline-previous-visible-heading)
;;       (local-set-key [C-down] 'outline-next-visible-heading)
;;       (local-set-key [C-left] 'hide-subtree)
;;       (local-set-key [C-right] 'show-onelevel)
;;       (local-set-key [M-up] 'outline-backward-same-level)
;;       (local-set-key [M-down] 'outline-forward-same-level)
;;       (local-set-key [M-left] 'hide-subtree)
;;       (local-set-key [M-right] 'show-subtree))
;;
;;     (add-hook
;;      'outline-minor-mode-hook
;;      'my-outline-bindings)
;;
;;     (defconst sort-of-yang-identifier-regexp "[-a-zA-Z0-9_\\.:]*")
;;
;;     (add-hook
;;      'yang-mode-hook
;;      '(lambda ()
;;         (outline-minor-mode)
;;         (setq outline-regexp
;;           (concat "^ *" sort-of-yang-identifier-regexp " *"
;;                   sort-of-yang-identifier-regexp
;;                   " *{"))))

;;; Code:

(use-package yang-mode)

;;; yang.el ends here
