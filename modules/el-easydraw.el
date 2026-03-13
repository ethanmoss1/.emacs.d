;;; el-easydraw.el --- Draw in Emacs!                -*- lexical-binding: t; -*-

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

;;; Commentary
;; Also known as edraw

;;; Code:

(use-package edraw-org
  :after org
  :ensure ( :host github
            :repo "misohena/el-easydraw"
            :files (:defaults "*.el"))
  :config
  ;; Set up all the hooks and minor modes for edraw
  (edraw-org-link-setup-exporter)
  (edraw-org-setup-inline-images)
  (edraw-org-setup-text-conversion) ;; For android
  (edraw-org-link-image-mode)

  ;; (add-to-list 'display-buffer-alist
  ;;              `(,@edraw-property-editor-buffer-name
  ;;                (display-buffer-in-side-window)
  ;;                (side . bottom)
  ;;                (slot . -1) ;; -1 == L  0 == Mid 1 == R
  ;;                (window-height . 0.33) ;; take 2/3 on bottom left
  ;;                (window-parameters
  ;;                 (no-delete-other-windows . nil))))

  ;; Customise the defaults
  :custom
  (edraw-popup-menu-style 'nil))

;;; el-easydraw.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
