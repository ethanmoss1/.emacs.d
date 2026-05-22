;;; modeline.el --- Modeline Modifications           -*- lexical-binding: t; -*-

;; Copyright (C) 2025

;; Author:  <ethan@macbook-pro>
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

;;; Code:

(use-package emacs
  :ensure nil
  :config
  (when (>= emacs-major-version 31)
    ;; see `mode-line-collapse-minor-modes’ for more information
    ;; Hide some modes
    (setopt mode-line-collapse-minor-modes '(abbrev-mode
					                         flyspell-mode
					                         flyspell-prog-mode
					                         eldoc-mode
					                         auto-revert-mode))
    ;; Hide all modes
    ;; (setopt mode-line-collapse-minor-modes '(not))
    )
  (defun mode-line-swap-element (elt)
    ;; If ELT is in mode-line, swap it with a auto-hiding version of itself.
    (cl-nsubstitute `(:eval (when (mode-line-window-selected-p) ,elt))
                    elt
                    mode-line-format
                    :test #'equal)))

;;; modeline.el ends here
