;;; helpful.el ---   -*- lexical-binding: t; -*-

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
(use-package helpful
  :bind
  ("C-h h" . #'helpful-at-point)
  ("C-h v" . #'helpful-variable)
  ("C-h f" . #'helpful-function)
  ("C-h c" . #'helpful-callable)
  ("C-h k" . #'helpful-key)
  ("C-h o" . #'helpful-symbol)
  :config
  (add-to-list 'display-buffer-alist
			   '("^\\*helpful"
                 (display-buffer-reuse-mode-window
                  display-buffer-pop-up-window-below
                  display-buffer-pop-up-window)
                 (mode . helpful-mode))))

;; helpful.el ends here
