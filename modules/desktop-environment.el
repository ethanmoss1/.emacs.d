;;; desktop-environment.el --- Keybindings for desktop-enviroment  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: exwm tabs

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
;; Keybindings for desktop-enviroment

;; Allows for global desktop keybindings

;;; Code:

;; https://github.com/emacs-exwm/exwm/issues/40#issuecomment-2127601569
(if (string-equal my-hostname "laptop")
	(define-minor-mode desktop-environment-mode
	  "A global minor-mode that binds DE keys."
	  :global t
	  :group 'bindings
	  :keymap (make-sparse-keymap)))

;;; desktop-environment.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
