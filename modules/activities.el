;;; activities.el --- Manage frames and tabs         -*- lexical-binding: t; -*-

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

(use-package activities
  :init
  ;; Prevent `edebug' default bindings from interfering.
  (setq edebug-inhibit-emacs-lisp-mode-bindings t)
  (unbind-key (kbd "C-x f"))  ; Removes `set-fill-column’ from key map
  :bind
  (("C-x f n"   . activities-new)
   ("C-x f d"   . activities-define)
   ("C-x f a"   . activities-resume)
   ("C-x f s"   . activities-suspend)
   ("C-x f k"   . activities-kill)
   ("C-x f RET" . activities-switch)
   ("C-x f b"   . activities-switch-buffer)
   ("C-x f g"   . activities-revert)
   ("C-x f l"   . activities-list))
  :config
  (activities-mode))

;;; activities.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
