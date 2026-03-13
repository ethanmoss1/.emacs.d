;;; window.el --- Lisp Window commands   -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: internal emacs builtin

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
;; Lisp Window commands

;; Modifying Window function that aren't written in C.

;;; Code:
(use-package window
  :ensure nil
  :config
  ;; Respect display actions specified. eg, in ‘display-buffer-alist’
  (setopt switch-to-buffer-obey-display-actions t)
  (setopt switch-to-buffer-in-dedicated-window 'pop)
  ;; (setopt display-buffer-base-action '(display-buffer-same-window))  ; default nil

  (setopt split-width-threshold 170
		  split-height-threshold nil)

  ;; resizing windows
  (setopt window-resize-pixelwise t
	      resize-mini-windows 'grow-only)

  ;; Window divider on EXWM
  ;; (if (string= my-hostname "laptop")
  ;; (add-hook 'elpaca-after-init-hook window-divider-mode))

  ;; and its settings
  (setopt window-divider-default-places t
	      window-divider-default-right-width 2
	      window-divider-default-bottom-width 2)

  ;; helper to make a window a dedicated one.
  (defun my/make-window-dedicated-toggle ()
    "Toggles the selected window, making it dedicated."
    (interactive)
    (let ((is-dedicated (window-dedicated-p (selected-window))))
	  (set-window-dedicated-p (selected-window) (not is-dedicated))
	  (message "Window dedicated: %s" (not is-dedicated))))

  (defun my/reset-frame-window-state ()
    "For when experementing with window states."
    (interactive)
    (set-frame-parameter (selected-frame) 'window-state nil)))

;;; window.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
