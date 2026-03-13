;;; uniquify.el --- Uniquify duplicate buffer names  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: buffer unique rename

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
;; Uniquify duplicate buffer names

;; Rename buffers that have the same name to be unique. Styling and other
;; customisation are done here

;;; Code:
(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-buffer-name-style 'reverse
		uniquify-separator " • "
		uniquify-after-kill-buffer-p t
		uniquify-ignore-buffers-re "^\\*"))

;;; uniquify.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
