;;; dired.el --- Directory Editor  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: directories dir editing files

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
;; Directory Editor

;; Dired makes an Emacs buffer containing a listing of a directory,
;; and optionally some of its subdirectories as well.  You can use the
;; normal Emacs commands to move around in this buffer, and special Dired
;; commands to operate on the listed files.  Dired works with both local and
;; remote directories.

;; TODO: Emacs 30 has a setting to not trash on remote sessions. need to set
;; that up.

;; Thanks to;
;; https://baty.net/posts/2025/03/toggle-hidden-files-in-dired-buffers/
;; for the dired-omit dotfiles

;;; Code:
(use-package dired
  :ensure nil
  :defer t
  :hook ((dired-mode . (lambda ()
                         (dired-omit-mode)
                         (dired-hide-details-mode)
                         )))
  :bind ( :map dired-mode-map ;; Variable is void when evaluated for first time
          ("D" . nil)
          ("D d" . 'dired-do-delete)
          ("D D" . 'dired-do-delete-skip-trash)
		  ("<left>"  . dired-up-directory)
		  ("<right>" . dired-find-file)
          ;; omit dotfiles
          ("." . dired-omit-mode))
  :config
  (require 'dired-x)
  (setopt dired-listing-switches "-lAvh --group-directories-first"
	      dired-auto-revert-buffer 'dired-directory-changed-p
	      dired-clean-confirm-killing-deleted-buffers t
	      dired-clean-up-buffers-too t
	      dired-create-destination-dirs 'always
	      dired-free-space 'separate
	      dired-mouse-drag-files 'move
          dired-recursive-copies 'always
          dired-recursive-deletes 'top
          dired-kill-when-opening-new-dired-buffer nil
          dired-dwim-target t
          dired-vc-rename-file t

          ;; hide .dot files when in dired-omit-mode
          dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

  ;; -- Functions --
  (defun dired-do-delete-skip-trash (&optional arg)
    "Delete marked files PERMANENTLY."
    (interactive "P")
    (let ((delete-by-moving-to-trash nil))
      (dired-do-delete arg))))

;; ;; TODO: this works but the problem is that the buffer doesnt exit on
;; ;; selecting a file, an the window doesnt replace the window that was last
;; ;; selected

;; (add-to-list 'display-buffer-alist
;;                '((major-mode . dired-mode)
;;                  (display-buffer-in-side-window)
;;                  (side . left)
;;                  (slot . -1) ;; -1 == L  0 == Mid 1 == R
;;                  (window-height . 0.20) ;; take 2/3 on bottom left
;;                  (window-parameters
;;                   (no-delete-other-windows . nil))))

;;; dired.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
