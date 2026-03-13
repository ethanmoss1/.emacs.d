;;; doom-modeline.el --- A Modeline makeover         -*- lexical-binding: t; -*-

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

;;; Code :----------------------------------------------------------------------

(use-package doom-modeline
  :init (doom-modeline-mode t)
  :config
  (setopt doom-modeline-major-mode-icon t
          doom-modeline-buffer-file-name-style 'auto
          doom-modeline-buffer-encoding nil
          doom-modeline-modal nil
          doom-modeline-minor-modes nil
          doom-modeline-hud nil))

;;; doom-modeline.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
