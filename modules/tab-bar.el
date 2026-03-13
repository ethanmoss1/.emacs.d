;;; tab-bar.el ---   -*- lexical-binding: t; -*-

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
(use-package tab-bar
  :ensure nil  ;; Because tab-bar is built-in, no need to install
  ;; :init (tab-bar-mode)
  :config
  ;; Set up the visuals of the tab-bar
  (setopt tab-bar-tab-hints nil
          tab-bar-close-button-show nil
	      ;; tab-bar-tab-name-function #'tab-bar-tab-name-truncated
	      tab-bar-tab-name-truncated-max 20
	      tab-bar-tab-name-ellipsis nil
	      tab-bar-auto-width t
	      ;; tab-bar-select-tab-modifiers '(super)
          tab-bar-separator nil
	      tab-bar-format '(tab-bar-format-tabs
                           tab-bar-format-align-right
                           ;; my/display-time
					       tab-bar-format-global)))

;;; tab-bar.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
