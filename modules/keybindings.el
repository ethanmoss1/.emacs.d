
;;; keybindings.el --- Personal keybindings  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: keybindings shortcuts windowsplit

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
;; Personal keybindings

;; This is my opinionated keybindings for GNU Emacs. Some default behaviours are
;; different from the original.

;;; Code:

(defun split-window-below-and-focus (&optional arg)
  (interactive "P")
  (split-window-below)
  (redisplay)           ; for exwm bug
  (windmove-down)
  (if arg
      (consult-buffer)))

(defun split-window-right-and-focus (&optional arg)
  (interactive "P")
  (split-window-right)
  (redisplay)           ; for exwm bug
  (windmove-right)
  (if arg
      (consult-buffer)))

(when (or (string-equal my-hostname "macbook")
          (string-equal my-hostname "thinkpad"))
  ;; Set the default keyboard state
  (setq my/laptop-keyboard-enabled t)
  ;; The name of the internal keyboard;
  (setq my/laptop-keyboard-name (pcase my-hostname
                                  ("macbook" "Apple Inc. Apple Internal Keyboard / Trackpad")
                                  ("thinkpad" "AT Translated Set 2 Keyboard")))

  ;; Get the ID of the internal keyboard
  (setq my/laptop-keyboard-id (string-to-number (shell-command-to-string (format "xinput list --id-only 'keyboard:%s'" my/laptop-keyboard-name))))

  ;; Toggle keyboard function
  (defun my/toggle-laptop-keyboard ()
    "Toggles the intergrated keyboard on my Macbook Pro"
    (interactive)
    (let ((kb-enable (if my/laptop-keyboard-enabled "disable" "enable")))
      (shell-command (format "xinput %s %s"
                             kb-enable
                             my/laptop-keyboard-id
                             ))
      (setq my/laptop-keyboard-enabled (not my/laptop-keyboard-enabled))
      (message "Internal Laptop keyboard: %s" kb-enable))))

(defun my/indent-whole-buffer ()
  "Indent the entire buffer without affecting point or mark."
  (interactive)
  (save-excursion
    (save-restriction
      (indent-region (point-min) (point-max)))))

;; Unbind suspend
(global-unset-key (kbd "C-z"))

(use-package emacs
  :ensure nil
  :bind ( :map ctl-x-map
          ("k" . 'kill-current-buffer)   ; Kill buffer without asking which one
		  ("C-b" . 'ibuffer)
          ("2" . 'split-window-below-and-focus)
          ("3" . 'split-window-right-and-focus)
          ("TAB" . #'my/indent-whole-buffer) ; replaces `indent-rigidly’.
          ))

;;; keybindings.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
