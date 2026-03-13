;;; c-code.el --- C code defined functions and variables  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: c code emacs init

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
;; C code defined functions and variables

;; Modifications to variables and functions that are defined within the c code core of emacs

;;; Code:
(use-package emacs
  :ensure nil
  :config
  ;; Allow all commands
  (setq disabled-command-function nil)

  ;; Visual
  (setq-default tab-width 4          ; Visual tab amount
                truncate-lines t
                fill-column 80)

  (setq scroll-margin 2                               ; Scroll when x lines from window boundary.
        scroll-step 0                                 ; scroll amount
        scroll-conservatively most-positive-fixnum    ; dont want to jumps around
        use-dialog-box nil                 ; Dont want GUI popups
        frame-title-format '("Emacs - " (:eval (if (buffer-file-name)
                                                   (abbreviate-file-name
                                                    (buffer-file-name))
                                                 "%b"))))

  ;; Set default font based on priority list
  (if window-system
      (let* ((families '("JetBrains Nerd Font Mono"
                         "JetBrains Mono"
                         "Roboto Mono"
                         "RobotoMono NF"
                         "Droid Sans Mono"
                         "Roboto"
                         ;; Mac familys
                         "JetBrainsMono"
                         "RobotoMono Nerd Font Mono"))
             (family (catch 'found
                       (dolist (f families)
                         (if (member f (font-family-list))
                             (throw 'found f))))))
        (set-face-attribute 'default nil
                            :family family :height 120)
        (if family
            (message (concat "Font loaded: " family))
          (message (concat "No Font loaded, Could not find a font"))))))

;;; c-code.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
