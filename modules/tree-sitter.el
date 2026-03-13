;;; tree-sitter.el --- Syntax highlighting           -*- lexical-binding: t; -*-

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

(use-package tree-sitter
  :config
  (global-tree-sitter-mode)

  (use-package tree-sitter-langs)
  ;; (use-package ts-fold
  ;;   ;; :straight
  ;;   ;; (ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold")
  ;;   :init
  ;;   (use-package ts-fold-indicators
  ;;     ;; :straight
  ;;     ;; (ts-fold-indicators :type git :host github
  ;;                         ;; :repo "emacs-tree-sitter/ts-fold")
  ;;     ))

  :hook
  ((java-mode . tree-sitter-hl-mode)
   ;; (emacs-lisp-mode . tree-sitter-hl-mode)
   ))


;;; tree-sitter.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
