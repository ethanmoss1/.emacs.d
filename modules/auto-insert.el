;;; auto-insert.el --- Automatic boilerplating  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: template auto boilerplate emacs

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
;; Automatic boilerplating

;; Package automatically adds defined content to new files.

;;; Code:
(use-package autoinsert
  :ensure nil
  :config
  (setq auto-insert-directory (concat user-emacs-directory "auto-insert/")
		auto-insert-query nil)

  (add-to-list 'auto-insert-alist
               '((".+\\.nix" . "Template for Nix Modules")
                 nil
                 "{ config, pkgs, ... }:" \n
                 "{" \n _ "\n}"))
  (add-to-list 'auto-insert-alist
               '((".+\\.sh" . "Template for shell scripts")
                 nil
                 "#!/usr/bin/env bash" \n
                 "set -euo pipefail" \n \n))

  (auto-insert-mode t))

;;; auto-insert.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
