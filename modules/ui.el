;;; ui.el --- Emacs UI Customisation  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: ui

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
;; Emacs UI Customisation

;; Opinionated UI customisation, This removes a lot of clutter and startup
;; noise. It also changes some defaults so some sainer (?)

;;; Code:
;; Change startup message

;; Remove default additions to maximise lines
;; (when (fboundp 'tool-bar-mode)
;;   (tool-bar-mode nil))
;; (when (fboundp 'scroll-bar-mode)
;;   (scroll-bar-mode nil))
;; (menu-bar-mode -1)
;; (tooltip-mode nil)

;; ;; Set up font
;; (if window-system
;;     ;; Set default font based on priority list
;;     (let* ((families '("JetBrains Nerd Font Mono"
;;                        "JetBrains Mono"
;;                        "Roboto Nerd Font Mono"
;;                        "Roboto Mono"
;;                        "Droid Sans Mono"
;;                        "Roboto"))
;;            (family (catch 'found
;;                      (dolist (f families)
;;                        (if (member f (font-family-list))
;;                            (throw 'found f))))))
;;       (set-face-attribute 'default nil
;;                             :family family :height 120)
;;       (message (concat "Font loaded: " family))))

(provide 'ui)
;;; ui.el ends here --------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
