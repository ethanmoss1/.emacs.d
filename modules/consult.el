;;; consult.el ---   -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
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

;;; Commentary :
;; `consult-line-symbol-at-point’ from;
;; http://arialdomartini.github.io/consult-line-at-point

;;; Code :

;; Functions
(defun consult-line-symbol-at-point ()
  "Search for a line matching the symbol found near point."
  (interactive)
  (consult-line
   (or (thing-at-point 'symbol))))

;; Declaration
(use-package consult
  :bind (("C-t" . #'consult-imenu)
         ;; ("C-s" . #'consult-isearch-history)

		 ("C-x b" . #'consult-buffer)
         ("C-x 4 b" . #'consult-buffer-other-window)
         ("C-x r b" . #'consult-bookmark)
         ("C-h i" . #'consult-info)

         ("M-y" . #'consult-yank-pop)
         ;; Project related
         ("C-x p b" . #'consult-project-buffer)


		 ("M-g M-g" . #'consult-goto-line)
         ("M-s ." . #'consult-line-symbol-at-point))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

;; consult.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
