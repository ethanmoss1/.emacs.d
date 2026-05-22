;;; minions.el --- Hide minor modes                  -*- lexical-binding: t; -*-
;; Copyright (C) 2026  Ethan Moss

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

;;; Code :
(use-package minions
  :hook ((elpaca-after-init . minions-mode)
         (minions-mode . (lambda () (mode-line-swap-element 'minions-mode-line-modes))))
  :config
  (setopt minions-mode-line-lighter " ∷"))


;;; minions.el ends here
