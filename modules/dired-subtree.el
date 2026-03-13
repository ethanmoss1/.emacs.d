;;; dired-subtree.el --- Tab open folders in a single buffer  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  termux

;; Author: termux <u0_a379@localhost>
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

(use-package dired-subtree
  :bind ( :map dired-mode-map
          ("<tab>" . dired-subtree-toggle)
          ("<backtab>" . dired-subtree-remove)
          ("TAB" . dired-subtree-toggle)
          ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

;;; dired-subtree.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
