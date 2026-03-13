;;; c.el --- Config for the C programming language   -*- lexical-binding: t; -*-

;; Copyright (C) 2025

;; Author:  <ethan@macbook-pro>
;; Keywords: c, lisp

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

;; A lot of information came from the following;
;; https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/

;;; Code:

(use-package emacs  ; c-mode
  :ensure nil
  :after eglot auto-insert ;; needed?
  ;; :hook (c-mode . lsp-deferred)
  :hook ((c-mode . eglot-ensure)
         (c-ts-mode . eglot-ensure)
         (c-mode . display-line-numbers-mode)
         (c--tsmode . display-line-numbers-mode))
  ;; :bind ( :map c-mode-base-map ("" . ))
  :config
  (if (not major-mode-remap-alist)
      (setopt major-mode-remap-alist '((c-mode . c-ts-mode)))
    (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode)))

  (if (fboundp 'auto-insert-mode)
      (add-to-list 'auto-insert-alist
                   '((".+\\.c$" . "Template for C files")
                     nil
                     "#include <stdio.h>" \n \n
                     "int main() {" \n
                     > _ \n
                     "}"\n)))


  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(c-ts-mode . ("clang"))))

  ;; C mode settings
  (setopt )
  )

;; (use-package clang-capf
;;   :init
;;   (defun my/clang-capf-init ()
;;     "Add `clang-capf' to `completion-at-point-functions'."
;;     (add-hook 'completion-at-point-functions #'clang-capf nil t))
;;   :hook (c-mode . my/clang-capf-init))

;;; c.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
