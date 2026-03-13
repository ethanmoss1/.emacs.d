;;; vundo.el --- Visual Undo History                 -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <ethan@nixos>
;; Keywords: tools, lisp

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

(use-package vundo
  :bind (("M-/" . vundo)
         ("C-/" . undo))
  :config
  ;; Set up the glyphs used in the graph.
  (setq vundo-glyph-alist '((selected-node . ?●)
                            (node . ?○)
                            (horizontal-stem . ?─)
                            (vertical-stem . ?│)
                            (branch . ?├)
                            (last-branch . ?└))
        undo-limit 10000000) ; 1mb
  )
;; (vundo-popup-mode))

;;; vundo.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
