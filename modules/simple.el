;;; simple.el ---   -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords:

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
;;

;;

;;; Code:
(use-package simple
  :ensure nil
  :config
  (setq indent-tabs-mode nil
                                        ; generates tabs distances at 4 spaces increments
		tab-stop-list (number-sequence 4 120 4))

  (setq line-number-mode t
        column-number-mode t)

  ;; Enable some modes
  (indent-tabs-mode nil)
  (line-number-mode -1)
  (visual-line-mode nil)
  (setopt save-interprogram-paste-before-kill t))

;;; simple.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
