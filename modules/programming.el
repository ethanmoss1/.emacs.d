;;; programming.el ---   -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
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

;;; Commentary :

;;; Code :
(defun programming-minor-modes ()
  "Enable minor modes for programming buffer"
  ;; (display-line-numbers-mode t)
  (display-fill-column-indicator-mode t) ;; See line for max columns
  (hl-line-mode t)
  ;; (column-number-mode t)
  ;; currently using jinx
  ;; (if (fboundp 'jinx-mode)
  ;;     (flyspell-prog-mode))
  (subword-mode t)
  (if (fboundp 'rainbow-mode)
	  (rainbow-mode 1)))

(use-package emacs
  :ensure nil
  :hook (prog-mode . programming-minor-modes))

;;; programming.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
