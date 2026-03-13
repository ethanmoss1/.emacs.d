;;; hl-todo.el ---   -*- lexical-binding: t; -*-

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
(use-package hl-todo
  :hook (prog-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
		;;hl-todo-color-background 't
		hl-todo-keyword-faces '(("TODO" . warning)
								("FIX" . error)
								;; ("TODO" . (warning :inverse-video t))
								;; ("FIX" . (error :inverse-video))
								("HACK" . (font-lock-constant-face bold))
								("REVIEW" . font-lock-keyword-face)
								("NOTE" . success)
								("DEPRECATED"  . (font-lock-doc-face bold)))))

;;; hl-todo.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
