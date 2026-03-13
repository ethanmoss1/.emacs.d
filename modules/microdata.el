;;; microdata.el --- Extracting microdata from HTML and emails  -*- lexical-binding: t; -*-

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

;;; Commentary:
;; https://github.com/Stebalien/microdata.el

;;; Code:

(use-package microdata
  :after (notmuch)
  :ensure ( :host github :repo "Stebalien/microdata.el"
            :files (:defaults "*.el"))
  :config
  ;; Setup Notmuch intergration
  (require 'notmuch-microdata)
  (bind-keys :map notmuch-show-mode-map
             ("C-c C-c" . notmuch-microdata-show-action-view)
             :map notmuch-search-mode-map
             ("C-c C-c" . notmuch-microdata-show-action-view)
             :map notmuch-tree-mode-map
             ("C-c C-c" . notmuch-microdata-show-action-view)))

;;; microdata.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
