;;; mct.el --- Minibuffer Confines Transcended       -*- lexical-binding: t; -*-

;; Copyright (C) 2025

;; Author:  <ethan@macbook-pro>
;; Keywords: lisp, lisp

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

(use-package mct
  :ensure t
  :config
  (setq mct-completion-window-size (cons #'mct-frame-height-third 1))
  (setq mct-remove-shadowed-file-names t) ; works when `file-name-shadow-mode' is enabled
  (setq mct-hide-completion-mode-line t)
  (setq mct-completing-read-multiple-indicator t)
  (setq mct-minimum-input 3)
  (setq mct-live-completion t)
  (setq mct-live-update-delay 0.6)

  ;; This is for commands or completion categories that should always pop
  ;; up the completions' buffer.  It circumvents the default method of
  ;; waiting for some user input (see `mct-minimum-input') before
  ;; displaying and updating the completions' buffer.
  (setq mct-completion-passlist
        '(;; Some commands
          select-frame-by-name
          Info-goto-node
          Info-index
          Info-menu
          vc-retrieve-tag
          ;; Some completion categories
          consult-buffer
          consult-location
          embark-keybinding
          imenu
          file
          project-file
          buffer
          kill-ring))

  ;; The blocklist follows the same principle as the passlist, except it
  ;; disables live completions altogether.
  (setq mct-completion-blocklist nil)

  ;; This is the default value but I am keeping it here for visibility.
  (setq mct-sort-by-command-or-category
        '((file . mct-sort-by-directory-then-by-file)
          ((magit-checkout vc-retrieve-tag) . mct-sort-by-alpha-then-by-length)
          ((kill-ring imenu consult-location Info-goto-node Info-index Info-menu) . nil) ; no sorting
          (t . mct-sort-by-history)))

  (mct-mode 1))


;;; General settings for the minibuffer

;; (setq completion-styles '(basic substring initials flex partial-completion))
;; (setq completion-category-defaults nil)
;; (setq completion-category-overrides
;;       '((file (styles . (basic partial-completion initials substring)))))
;;
;; (setq completion-cycle-threshold 2)
;; (setq completion-ignore-case t)
;; (setq completion-show-inline-help nil)
;;
;; (setq completions-detailed t)
;;
;; (setq enable-recursive-minibuffers t)
;; (setq minibuffer-eldef-shorten-default t)
;;
;; (setq read-buffer-completion-ignore-case t)
;; (setq read-file-name-completion-ignore-case t)
;;
;; (setq resize-mini-windows t)
;; (setq minibuffer-eldef-shorten-default t)
;;
;; (file-name-shadow-mode 1)
;; (minibuffer-depth-indicate-mode 1)
;; (minibuffer-electric-default-mode 1)
;;
;; ;; Do not allow the cursor in the minibuffer prompt
;; (setq minibuffer-prompt-properties
;;       '(read-only t cursor-intangible t face minibuffer-prompt))
;;
;; (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;;; mct.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
