;;; citar-org-roam.el --- Integrate Citar with Org-roam  -*- lexical-binding: t; -*-

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

(use-package citar-org-roam
  :after (citar org-roam)
  :bind (("C-c r r" . 'citar-open))
  :config
  (setopt citar-org-roam-subdir "cite-notes")
  (add-to-list 'org-roam-capture-templates '("n" "literature note" plain "%?" :target
                                             (file+head
                                              "%(expand-file-name (or citar-org-roam-subdir \"\") org-roam-directory)/${citar-citekey}.org"
                                              "#+title: ${note-title} (${citar-date})\n\n")
                                             :unnarrowed t))
  (setopt citar-org-roam-capture-template-key "n")
  (citar-org-roam-mode t))

;;; citar-org-roam.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
