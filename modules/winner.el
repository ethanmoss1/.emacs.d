;;; winner.el --- Restore Window configurations      -*- lexical-binding: t; -*-

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

(use-package winner
  :ensure nil
  :bind (("C-x w n" . 'winner-redo)
         ("C-x w p" . 'winner-undo))
  :config

  ;; (defvar winner-repeat-map
  ;;   (let ((map (make-sparse-keymap)))
  ;;     (define-key map "p" #'winner-undo)
  ;;     (define-key map "n" #'winner-redo)
  ;;     map)
  ;;   "Keymap for repeating winner-mode commands.")
  ;;
  ;; (put #'winner-undo 'repeat-map 'winner-repeat-map)
  ;; (put #'winner-redo 'repeat-map 'winner-repeat-map)

  (winner-mode))

;;; winner.el ends here
