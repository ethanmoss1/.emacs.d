;;; files.el ---   -*- lexical-binding: t;-*-

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

;;; Code:
(use-package files
  :ensure nil
  :config
  ;; Delete by moving to trash
  (setq delete-by-moving-to-trash (not noninteractive))

  ;; Disable the warning "X and Y are the same file". Ignoring this warning is
  ;; acceptable since it will redirect you to the existing buffer regardless.
  (setq find-file-suppress-same-file-warnings t)

  ;; Resolve symlinks when opening files, so that any operations are conducted
  ;; from the file's true directory (like `find-file').
  (setq find-file-visit-truename t
		vc-follow-symlinks t)

  ;; Skip confirmation prompts when creating a new file or buffer
  (setq confirm-nonexistent-file-or-buffer nil)


  ;; Avoid generating backups or lockfiles to prevent creating world-readable
  ;; copies of files.
  (setq create-lockfiles nil
		make-backup-files nil)

  (setq backup-directory-alist `((".*" . ,(expand-file-name
										   "cache/backup/"
										   user-emacs-directory))))

  ;; Backup by copying rather than renaming
  (setq backup-by-copying t
		backup-by-copying-when-linked t)

  ;; Version control
  (setq version-control t
		vc-make-backup-files nil
		kept-new-versions 5
		kept-old-versions 5
		delete-old-versions t)

  ;; misc file options
  (setq require-final-newline t
        large-file-warning-threshold nil)

  ;; Auto save options
  ;; Enable auto-save to safeguard against crashes or data loss. The
  ;; `recover-file' or `recover-session' functions can be used to restore
  ;; auto-saved data.
  (setq auto-save-default t)

  ;; Do not auto-disable auto-save after deleting large chunks of
  ;; text. The purpose of auto-save is to provide a failsafe, and
  ;; disabling it contradicts this objective.
  (setq auto-save-include-big-deletions t)

  (setq auto-save-list-file-prefix
		(expand-file-name "cache/autosave/" user-emacs-directory)
		tramp-auto-save-directory
		(expand-file-name "cache/tramp-autosave/" user-emacs-directory))

  ;; Auto save options
  (setq kill-buffer-delete-auto-save-files t)

  ;;; Auto revert
  ;; Auto-revert in Emacs is a feature that automatically updates the
  ;; contents of a buffer to reflect changes made to the underlying file
  ;; on disk.
  (global-auto-revert-mode 1)
  (setq revert-without-query (list ".")  ; Do not prompt
		auto-revert-stop-on-user-input nil
		auto-revert-verbose t)
  ;;    auto-revert-remote-files t)

  ;; Revert other buffers (e.g, Dired)
  (setq global-auto-revert-non-file-buffers t)


  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'before-save-hook
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (and (not (file-exists-p dir))
                             (y-or-n-p
                              (format "Directory %s doesn't exist.  Create it?" dir)))
                    (make-directory dir t))))))
  (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p))

;;; files.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
