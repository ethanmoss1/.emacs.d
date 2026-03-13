;;; org-roam-timestamps.el --- Timestamp Org-Roam Files  -*- lexical-binding: t; -*-

;; Copyright (C) 2025

;; Author:  <ethan@macbook-pro>
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

(use-package org-roam-timestamps
  :config
  ;; Run ‘org-roam-timestamps-all’, This will add ctime and mtime properties to
  ;; all the property drawers of your notes.

  ;; This will also update the parent file when you update a subnote.
  (setopt org-roam-timestamps-parent-file t)

  ;; This will remember previous mtimes and add the new timestamp to the front
  ;; of the list rather than replace the old one. This will allow us to create
  ;; git-like time-tracker-views in org-roam-ui, showing you when you modified
  ;; which files. It will however clog up your properties drawer a lot more and
  ;; of course increase file size. If you previously had this turned on but want
  ;; to remove it for all files, run `org-roam-timestamps-clean-mtimes’.
  (setopt org-roam-timestamps-remember-timestamps 'nil)

  ;; Minimum time in seconds between two timestamps. Defaults to an hour. Only
  ;; does something if org-roam-timestamps-remember-timestamps is t
  (setopt org-roam-timestamps-minimum-gap 3600)

  ;; Start the minor mode.
  (org-roam-timestamps-mode))

;;; org-roam-timestamps.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
