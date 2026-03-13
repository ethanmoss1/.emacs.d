;;; eglot.el --- LSP for Emacs                       -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Ethan Moss

;; Author: Ethan Moss <ethan@Ethans-MacBook-Pro.local>
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

(use-package eldoc
  :ensure nil)

(use-package eldoc-box
  :after eglot
  :config (eldoc-box-hover-at-point-mode))

(use-package eglot
  :ensure nil
  :after eldoc
  :bind
  ( :map eglot-mode-map
    ("C-c e r" . eglot-rename)
    ("C-c e h" . eldoc)
    ("C-c e f" . eglot-format-buffer))
  :config
  ;; Thanks to the following post for helping setup
  ;; https://andreyor.st/posts/2023-09-09-migrating-from-lsp-mode-to-eglot/
  (setopt eglot-autoshutdown t
          eglot-extend-to-xref nil
          eglot-ignored-server-capabilities '(:inlayHintProvider
                                              :documentHighlightProvider)))

;;; eglot.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
