;;; qutebrowser.el --- Browser intergration into Emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2026

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

;;; Code:

(use-package qutebrowser
  :ensure ( :host github
            :repo "lrustand/qutebrowser.el"
            :files (:defaults "*.el" "*.py"))
  :after (consult exwm)
  :hook (elpaca-after-init . global-qutebrowser-exwm-mode)
  :config
  (unless server-process
    (server-start))
  ;; Export the current theme to be used in qutebrowser
  (qutebrowser-theme-export-mode))

;;; qutebrowser.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
