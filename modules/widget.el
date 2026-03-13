;;; widget.el --- Emacs ui customisation  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: extension builtin

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
;; Emacs ui customisation

;; Most graphical user interface toolkits provide a number of standard
;; userinterface controls (sometimes known as “widgets” or “gadgets”).  Emacs
;; doesn’t really support anything like this, except for an incredibly powerful
;; text “widget”.  On the other hand, Emacs does provide the necessary
;; primitives to implement many other widgets within a text buffer.  The
;; ‘widget’ package simplifies this task.

;;; Code:
(use-package widget
  :ensure nil
  :config
  ;; No ugly button for checkboxes
  (setq widget-image-enable nil))

;;; widget.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
