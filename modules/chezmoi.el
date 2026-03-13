;;; chezmoi.el ---   -*- lexical-binding: t; -*-

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

;;; Code :
(use-package chezmoi
  :if (executable-find "chezmoi")
  :bind
  ("C-c d f" . 'chezmoi-find)
  ("C-c d s" . 'chezmoi-find-in-files)
  ("C-c d g" . 'chezmoi-magit-status)
  ;; ("C-c d e" . 'chezmoi-goto-emacs-folder)
  ("C-c d c" . 'chezmoi-goto-chezmoi-folder)
  :config
  (defvar chezmoi-directory (shell-command-to-string "printf %s \"$(chezmoi source-path)\"")
    "Folder of the Chezmoi directory")

  (defun chezmoi-dired-add-marked-files ()
    "Add files marked in Dired to source state."
    (interactive)
    (dolist (file (dired-get-marked-files))
      (shell-command (concat chezmoi-command " add " (shell-quote-argument file)))))

  (defun chezmoi-magit-status ()
    "Show the status of the chezmoi source repository."
    (interactive)
    (magit-status-setup-buffer (cl-first (chezmoi--dispatch "source-path"))))

  (defun chezmoi-goto-emacs-folder ()
    "Go to the emacs user directory"
    (interactive)
    (dired user-emacs-directory))

  (defun chezmoi-goto-chezmoi-folder ()
    "Go to the chezmoi directory"
    (interactive)
    (dired chezmoi-directory))

  (defun chezmoi-find-in-files ()
    "Find the given REGEX in the chezmoi directory"
    (interactive)
    (consult-grep chezmoi-directory)))

;; chezmoi.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
